require 'rss'

namespace :crawl_blogs do
  
  task :crawl => :environment do
    blogs = Blog.all
    blogs.each do |blog|

      data = RSS::Parser.parse(blog.link)
      article= Article.new
      blog = Blog.new
      data.items.each do |item|
        next if Article.where(["blog_id = ? AND title = ?", blog.id, item.title]).empty?
        article = Article.new
        article.title = item.title
        article.url = item.link
        article.publish = item.pubDate
        article.save

      end
    end 
  end
end
