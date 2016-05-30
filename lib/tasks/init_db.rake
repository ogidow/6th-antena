namespace :init_db do
    
    task :insert_blogs => :environment do
      blogs =[
        {name: "homma.py", author: "またく", image: "https://pbs.twimg.com/profile_images/689881504722251776/0hPHQzeP.jpg", link: "http://rhythnn.net/rss"},
        {name: "shimoju.log", author: "しもじゅー", image: "https://pbs.twimg.com/profile_images/726403064182120450/2vviBxh8.jpg", link: "ihttps://shimoju.org/feed"},
        {name: "whimlog", author: "スン", image: "https://pbs.twimg.com/profile_images/726782069481721857/A3HDFBjQ.jpg", link: "http://asuforce.hatenablog.com/rss"},
        {name: "おいしい記録", author: "えっこ", image: "", link: "ihttp://ekko-nomy.jugem.jp/?mode=rss"},
        {name: "ogidowの日記", author: "おぎどー", image: "https://pbs.twimg.com/profile_images/734659407963815936/oxYPIVNz.jpg", link: "http://ogidow.hateblo.jp/rss"},
      ]

      blogs.each do |blog|
        obj = Blog.new
        obj.name = blog[:name]
        obj.author = blog[:author]
        obj.image = blog[:image]
        obj.link = blog[:link]

        obj.save
      end
    end
end
