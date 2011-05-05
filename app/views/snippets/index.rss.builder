xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "HTML5 Snippets "
    xml.description "Learn HTML5 by sharing and rating html5 snippets"
    xml.link snippets_url

    for post in @snippets
      xml.item do
        xml.title post.name
        xml.description post.description
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link snippet_url(post)
        xml.guid snippet_url(post)
      end
    end
  end
end