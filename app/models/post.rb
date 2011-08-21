# == Schema Information
# Schema version: 20110414230141
#
# Table name: posts
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  title         :string(255)
#  content       :text
#  created_at    :datetime
#  updated_at    :datetime
#  comment_count :integer
#

class Post < ActiveRecord::Base
  #tagging stuff
  acts_as_taggable_on :tags
  named_scope :by_date, :order => "created_at DESC"

  attr_accessible :name, :title, :content, :comment_count, :tag_list
  validates :name,  :presence => true
  validates :title, :presence => true,
                   :length => { :minimum => 5 }
  validate :content, :presence => true
  has_many :comments, :dependent => :destroy
  def to_param
    "#{id}-#{title.gsub(/[^a-z1-9]+/i, '-')}"
  end

end
