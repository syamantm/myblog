module PostsHelper
  
  def popular_posts
    @popularPosts = Post.find(:all, :order => "comment_count desc", :limit => 10)
  end
  
  def truncate_words(text, length = 80)
     
    return if text == nil
    end_string = " ..."
    words = text.split()
    words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
  end
  
  def archive_record
    @posts_by_month = Post.find(:all).group_by { |post| post.created_at.strftime("%B %Y") }
  end
end
