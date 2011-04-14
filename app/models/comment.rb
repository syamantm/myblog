# == Schema Information
# Schema version: 20110414221129
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  commenter  :string(255)
#  body       :text
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  website    :string(255)
#

class Comment < ActiveRecord::Base
  belongs_to :post
  
  # I'm not a regex expert, I just know how to google :P
  url_regex = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix

  validates :commenter, :presence => true,
                   :length   => { :maximum => 50 }
  
  validates :body, :presence => true
  
  validates :website, :format   => { :with => url_regex }  
  
  after_save :count_comment
  
  private
  
  def count_comment
    post =   self.post
    post.comment_count = post.comments.count
    post.save
  end
                    
end
