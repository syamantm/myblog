xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Articles"
    xml.description "My blog Articles"
    xml.link posts_url
    
    for article in @posts
      xml.item do
        xml.title article.title
        xml.description article.content
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link posts_url(article, :rss)        
      end
    end
  end
end