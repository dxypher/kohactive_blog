class Tag < ActiveRecord::Base
  attr_accessible :title
  
  has_many :post_tags
  has_many :posts, through: :post_tags
  

    
end
