xml.instruct!

xml.urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9") do
  xml.url do
    xml.loc root_url
  end

  @posts.each do |post|
    xml.url do
      xml.loc post_url(post.slug)
      xml.lastmod post.updated_at.strftime("%Y-%m-%dT%H:%M:%S.%2N%:z")
    end
  end
end
