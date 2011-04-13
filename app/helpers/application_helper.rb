module ApplicationHelper
  
def logo
    logo = image_tag("logo.png", :alt => "My Blog Logo", :class => "round")    
  end
  
  # Return a title on a per-page basis.
  
  def title
    base_title = "My Blog"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
