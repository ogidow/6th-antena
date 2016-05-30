require 'rss'

namespace :crawl_blogs do
  
  task :crawl => :environment do
    blogs = Blog.all
    blogs.each do |blog|
      data = RSS::Parser.parse(blog.link)
      data.items.each do |item|
        next if !Article.where(["blog_id = ? AND title = ?", blog.id, item.title]).empty?
        article = Article.new
        article.blog_id = blog.id
        article.title = item.title
        article.url = item.link
        article.publish = item.respond_to?(:pubDate) ? item.pubDate : item.dc_date
        article.save
      end
    end 
  end
end
