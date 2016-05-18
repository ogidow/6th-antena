require 'rss'

namespace :crawl_blogs do
  blogs = ['http://rhythnn.net/rss']
  task :crawl do
    blogs.each do |url|
      data = RSS::Parser.parse(url)

      data.items.each do |item|
        p item
        break
      end
    end 
  end
end
