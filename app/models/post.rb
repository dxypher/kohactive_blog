class Post < ActiveRecord::Base
  
  attr_accessible :body, :title
  
  belongs_to :author, class_name: "User"
  has_and_belongs_to_many :tags
  has_many :comments
  
end
