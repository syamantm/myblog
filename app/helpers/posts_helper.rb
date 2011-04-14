module PostsHelper
  
  def popular_posts
    @popularPosts = Post.find(:all, :order => "comment_count desc", :limit => 10)
  end
end
