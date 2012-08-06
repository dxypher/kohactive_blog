class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation
  attr_accessor :password
  
  
  before_save :encrypt_password
  
  validates :password, :confirmation => true
  validates :password,  :presence => true, on: :create
  validates :email, :presence => true
  validates :email, :uniqueness => true
        
  
  has_many :posts
  has_many :comments, through: :posts
  
  def self.authenticate(user_hash)
    user = find_by_email(user_hash[:email])
    if user && user.password_hash == ::BCrypt::Engine.hash_secret(user_hash[:password], user.password_salt)
      user
    else
      User.new({:email => user_hash[:email]})
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = ::BCrypt::Engine.generate_salt
      self.password_hash = ::BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
