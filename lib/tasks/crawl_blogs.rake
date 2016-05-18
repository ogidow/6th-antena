require 'rss'

namespace :crawl_blogs do
  blogs = ['http://rhythnn.net/rss']
  task :crawl => :environment do
    blogs.each do |blog|
      data = RSS::Parser.parse(blog.url)
      article= Article.new
      p article
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
