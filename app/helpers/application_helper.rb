module ApplicationHelper
  def logo
    logo = image_tag("bloghome .png", :alt => "My Blog Logo", :class => "round")
  end

  # Return a title on a per-page basis.

  def title
    base_title = "Syamantak Mukhopadhyay - Weblog"
    if @title.nil?
    base_title
    else
      "#{@title}"
    end
  end

  def markdownPost(text)
    options = [:hard_wrap, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
  end
  
  def markdownComments(text)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end

end
