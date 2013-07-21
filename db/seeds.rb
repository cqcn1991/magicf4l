# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#puts 'DEFAULT Categories'
#categories = Category.create([{name:'国内商业网站'},{name:'Ruby 社区网站'}, {name: 'Ruby 开源项目'} ])
#if categories.all?(&:save)
#  puts "categories saved"
#else
#  puts "categories saved failed"
#end

videos = Micropost.create([
   {video_url:'http://v.youku.com/v_show/id_XNTgxNzA5MzYw.html'},
   {video_url:'http://v.youku.com/v_show/id_XNTgxNzA4MzAw.html'},
   {video_url:'http://v.youku.com/v_show/id_XNTgxNzAzNTYw.html'},
   {video_url:'http://v.youku.com/v_show/id_XNTgxNTg0MTAw.html'},
   {video_url:'http://v.youku.com/v_show/id_XNTgxNTgyOTgw.html'},
   {video_url:'http://v.youku.com/v_show/id_XNTgxNTgxNjY0.html'},
   {video_url:'http://v.youku.com/v_show/id_XNTgxNTU4NTA4.html'},
   {video_url:'http://v.youku.com/v_show/id_XNTgxNDQ3MTcy.html'},
   {video_url:'http://v.youku.com/v_show/id_XNTgxNDI4NzI0.html'},
   {video_url:'http://v.youku.com/v_show/id_XNTgxMzkxNTE2.html'},
   {video_url:'http://v.youku.com/v_show/id_XNTgxMzc2OTA4.html'},
   {video_url:'http://v.youku.com/v_show/id_XNTgxMjk4MTc2.html'},
   {video_url:'http://v.youku.com/v_show/id_XNTgxMjA1OTQ4.html'},
   {video_url:'http://v.youku.com/v_show/id_XNTgxMTk2NzMy.html'},
   {video_url:'http://v.youku.com/v_show/id_XNTU1OTk2OTM2.html'},
   {video_url:'http://v.youku.com/v_show/id_XNTI4ODc4MzQ0.html'},
   {video_url:'http://v.youku.com/v_show/id_XNTM3MDkwODE2.html'},
   {video_url:'http://v.youku.com/v_show/id_XMjQ0ODQzNjQ0.html'},
   {video_url:'http://v.youku.com/v_show/id_XNTI1NzIyODI0.html'}
                          ])
if videos.all?(&:save)
  puts "categories saved"
else
  puts "categories saved failed"
end
