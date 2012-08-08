module PostsHelper
  def meta_helper post
    # date=post.created_at.strftime("%m/%d/%Y")
    date=distance_of_time_in_words(post.created_at, Time.now)
    tags=post.tags.collect{|t| link_to t.title, tag_path(t)}.join(", ")
    meta= "Posted #{date} ago " if date.present?
    meta+= "by #{link_to post.author.username, "#"} " if post.author.present?
    meta+= "in #{tags}"
    return raw(meta)
  end
end
