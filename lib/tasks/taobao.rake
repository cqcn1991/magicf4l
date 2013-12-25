# encoding: utf-8
desc "Fetch sites"
task :fetch_taobao => :environment do
  require 'nokogiri'
  require 'open-uri'

      url = "http://item.taobao.com/item.htm?spm=a1z10.1.w137644-1960500098.43.d7Uwpx&id=36246359192"
      doc = Nokogiri::HTML(open(url) )
      puts doc.css("title").text
      puts doc.css("img")[0]['src']
      puts doc.at_css("#J_ImgBooth")["data-src"]
  #doc.css(".col-span-4").each do |site|
  #  title=site.css("h4 a").text
  #  if !title.empty?
  #    href = site.css("a.thumbnail")[0]['href']
  #    photo_href="http://expo.getbootstrap.com" + site.css("a img")[0]["src"]
  #    puts title
  #    puts href
  #    puts photo_href
  #  end
  #end

end
