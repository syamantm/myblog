class PagesController < ApplicationController
  def home
    @title = "Home"
  end
  
  def about
    @title = "About Me"
  end
  
  def archive
    @title = "Archive"
  end

end
