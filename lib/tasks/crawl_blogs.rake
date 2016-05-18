require 'rss'

namespace :crawl_blogs do
  blogs = ['http://rhythnn.net/rss']
  task :crawl => :environment do
    blogs.each do |url|
      data = RSS::Parser.parse(url)
      article= Article.new
      p article
      data.items.each do |item|
        article = Article.new
        article.title = item.title
        article.url = item.link
        article.publish = item.pubDate
        article.save

      end
    end 
  end
end
