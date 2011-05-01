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
  attr_accessible :name, :title, :content, :comment_count
 validates :name,  :presence => true
 validates :title, :presence => true,
                   :length => { :minimum => 5 }
 validate :content, :presence => true
  has_many :comments, :dependent => :destroy  
  
 
  
end
