class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :post_tags
  has_many :tags, through: :post_tags, :autosave => true 
  has_many :comments
  
  attr_accessible :body, :title, :tags_attributes
  accepts_nested_attributes_for :tags, :allow_destroy => true
  
  
  def autosave_associated_records_for_tags
    
    tags.each do |t|
      unless t.marked_for_destruction?
        tag_ids = self.tags.collect{|t| t.id} #[5,6,7]
        tag = Tag.find_or_create_by_title(t.title) #<Tag: id:5 title:Technology>
        self.tags << tag unless tag_ids.include?(tag.id) #Uniqueness check from looked up Tag
      else
        pts = PostTag.find(:all, :conditions => {:post_id => self.id, :tag_id => t.id}) rescue []
        pts.each do |p|
          p.destroy
        end
      end
    end
  end
  
  
  
end
