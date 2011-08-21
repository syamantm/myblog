class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  include ActsAsTaggableOn::TagsHelper
  
  private
 
  def authenticate
    signed_in?
  end
  
end
