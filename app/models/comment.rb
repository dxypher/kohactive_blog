class Comment < ActiveRecord::Base
  attr_accessible :body
  
  belongs_to :post
  belongs_to :author, class_name: "User"
  
end
