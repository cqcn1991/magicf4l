# encoding: utf-8

desc "Fetch sites"
task :fetch_sites => :environment do
  require 'nokogiri'
  require 'open-uri'

  url = "http://ruby-china.org/sites"
  doc = Nokogiri::HTML(open(url))
  puts doc.css("title").text
  doc.css(".box").each do |box|
    if box.css("h2").text == "国外著名网站" then
      puts "get oversea cool sites"
      box.css(".site").each do |item|
        title=item.css("a").text
        description=item.css("a")[0]['title']
        original_url=item.css("a")[0]["href"]
        site = Site.where(:title=> title).first_or_create
        site.update_attributes(:description=> description, :site_url=> original_url)
        puts site.title
        puts site.site_url
        site.save!


      end
    end

  end



end