# encoding: utf-8

desc "Fetch sites"
task :fetch_bootstrap_sites => :environment do
  require 'nokogiri'
  require 'open-uri'

  url = "http://expo.getbootstrap.com/"
  doc = Nokogiri::HTML(open(url))
  puts doc.css("title").text
  doc.css(".col-span-4").each do |site|
      title=site.css("h4 a").text
      if !title.empty?
        href = site.css("a.thumbnail")[0]['href']
        photo_href="http://expo.getbootstrap.com" + site.css("a img")[0]["src"]
        puts title
        puts href
        puts photo_href
        site = Site.where(:title=> title).first_or_create
        site.update_attributes(:site_url=> href, :photo_url=> photo_href)
        site.save!
      end

          #description=item.css("a")[0]['title']
        #if title
        #  original_url=item.css('a.thumbnail')[0]["href"]
        #  #original_photo_url="http://expo.getbootstrap.com" + item.css("a img")[0]["src"]
        #  site = Site.where(:title=> title).first_or_create
        #  site.update_attributes(:description=> description, :site_url=> original_url)
        #  puts site.title
        #  puts site.site_url
        #  site.save!
        #end
    end

end
