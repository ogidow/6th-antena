require 'feed-normalizer'
require 'addressable/uri'
require 'nokogiri'
require 'open-uri'
require 'net/http'

namespace :crawl_blogs do
  
  def has_mb? str
    str.bytes do |b|
      return true if  (b & 0b10000000) != 0
    end
    false
  end  
  
  def extract_article_image url
    p url
    charset = nil
    r = Net::HTTP.get_response(URI.parse(url))
    if r.code == "301"
      url = r.header['location'].gsub(/#_=_$/, '')
      url = has_mb?(url) ? URI.encode(url) : url
    end

    html = open(url) do |f|
       charset = f.charset
       f.read
    end
    page = Nokogiri::HTML.parse(html, nil, charset)
    page.css('//meta[property="og:image"]/@content')[0].to_s
  end 

  task :crawl => :environment do
    blogs = Blog.all
    blogs.each do |blog|
      data =  FeedNormalizer::FeedNormalizer.parse(open(blog.link))
      data.items.each do |item|
        next if !Article.where(["blog_id = ? AND publish = ?", blog.id, item.date_published]).empty?
        article = Article.new
        article.blog_id = blog.id
        article.title = item.title

        description = !item.description.nil? ? item.description : item.content
        article.description = description
        article.url = item.url
        article.publish = item.date_published
        article.image = extract_article_image(article.url)
        article.save
      end
    end 
  end
end
