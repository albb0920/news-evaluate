# encoding: utf-8
require 'open-uri'
require 'rss'
require 'nokogiri'
task :get_news_cron => :environment do
	def get_news(url, key_words, title_path, article_path, liberty_flag)
		url.each do |test_url|
			open(test_url) do |rss|
				RSS::Parser.parse(rss).channel.items.each do |item|
					puts "#{Time.now} #{item.pubDate}"
					puts time =  Time.now - item.pubDate
					#if(time < 3600)
						f = open(item.link)
						doc = Nokogiri::HTML(f)
						puts doc.xpath(title_path).text
						if liberty_flag == 1
							tmp = doc.xpath(article_path)[1].text
						else
							puts "other"
							tmp = doc.xpath(article_path).text
						end
						key_words.each do |key|
							tmp = tmp.gsub(key, "<span class=\"hightlight_keyword\">#{key}</span>")
						end
						puts tmp
						puts doc.xpath(title_path).text
						puts tmp.length
						puts item.link.length
						a = Article.new(:title => doc.xpath(title_path).text, :content => tmp, :url => item.link)
						a.save
					#end
				end
			end
		end
	end
	key_words = ["陳沖", "網友表示", "扮柯南", "宅男", "癡女", "輕判", "恐龍法官", "陳?"]
	
	apple_url_array = ["http://www.appledaily.com.tw/rss/newcreate/kind/rnews/type/new", 
			   "http://www.appledaily.com.tw/rss/newcreate/kind/sec/type/1066", 
			   "http://www.appledaily.com.tw/rss/newcreate/kind/sec/type/151", 
			   "http://www.appledaily.com.tw/rss/newcreate/kind/sec/type/11", 
			   "http://www.appledaily.com.tw/rss/newcreate/kind/sec/type/1077"]

	udn_url_array = ["http://udn.com/udnrss/BREAKINGNEWS1.xml",
			 "http://udn.com/udnrss/latest.xml",
			 "http://udn.com/udnrss/focus.xml",
			 "http://udn.com/udnrss/politics.xml",
			 "http://udn.com/udnrss/social.xml",]

	liberty_url_array = ["http://www.libertytimes.com.tw/rss/fo.xml",
			     "http://www.libertytimes.com.tw/rss/p.xml",
			     "http://www.libertytimes.com.tw/rss/life.xml",
			     "http://www.libertytimes.com.tw/rss/so.xml"]

	wanwan_url_array = ["http://rss.chinatimes.com/rss/focus-u.rss",
			    "http://chinatimes.feedsportal.com/c/33012/f/537206/index.rss",
			    "http://chinatimes.feedsportal.com/c/33012/f/537209/index.rss"]

	get_news(apple_url_array, key_words, '//h1[@id="h1"]', '//p[@id="summary"]', 0)
	get_news(udn_url_array, key_words, '//div[@class="story_title"]', '//div[@id="story"]', 0)
	get_news(liberty_url_array, key_words, '//span[@id="newtitle"]', '//td[@id="newsContent"]/span', 1)
	get_news(wanwan_url_array, key_words, '//h1[@class="highlight"]', '//div[@id="ctkeywordcontent"]', 0)

	
end
