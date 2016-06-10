namespace :init_db do
    
    task :insert_blogs => :environment do
      blogs =[
        {name: "homma.py", author: "またく", image: "https://pbs.twimg.com/profile_images/689881504722251776/0hPHQzeP.jpg", link: "http://rhythnn.net/rss"},
        {name: "shimoju.log", author: "しもじゅー", image: "https://pbs.twimg.com/profile_images/726403064182120450/2vviBxh8.jpg", link: "https://shimoju.org/feed"},
        {name: "whimlog", author: "スン", image: "https://pbs.twimg.com/profile_images/726782069481721857/A3HDFBjQ.jpg", link: "http://asuforce.hatenablog.com/rss"},
        {name: "おいしい記録", author: "えっこ", image: "https://pbs.twimg.com/profile_images/731981652746862592/I1dIyde1.jpg", link: "http://ekko-nomy.jugem.jp/?mode=rss"},
        {name: "ogidowの日記", author: "おぎどー", image: "https://pbs.twimg.com/profile_images/734659407963815936/oxYPIVNz.jpg", link: "http://ogidow.hateblo.jp/rss"},	
        {name: "めまい", author: "ながみー", image: "https://pbs.twimg.com/profile_images/729591236995088384/o_lxityc.jpg", link: "http://ngmnda.tumblr.com/rss"}
        {name: "おとしものけいじばん", author: "あらやん", image: "https://pbs.twimg.com/profile_images/729591236995088384/o_lxityc.jpg", link: "mrkmrk.tumblr.com/rss"}
      ]

      blogs.each do |blog|
		next if !Blog.find_by_author(blog['author']).nil?
        obj = Blog.new
        obj.name = blog[:name]
        obj.author = blog[:author]
        obj.image = blog[:image]
        obj.link = blog[:link]

        obj.save
      end
    end
end
