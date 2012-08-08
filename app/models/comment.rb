class Comment < ActiveRecord::Base
  attr_accessible :body, :author
  
  belongs_to :post, counter_cache: true
  belongs_to :author, class_name: "User"
  
end
