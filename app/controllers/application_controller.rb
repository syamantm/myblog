class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  private
 
  def authenticate
    signed_in?
  end
  
end
