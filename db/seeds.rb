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
      {video_url:'http://v.youku.com/v_show/id_XNTI1NzIyODI0.html'},
      {video_url:'http://v.youku.com/v_show/id_XMjI4MzQ4NDc2.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTUwODc2.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTQ3NDMy.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTQ3NDI0.html'},
      {video_url:'http://v.youku.com/v_show/id_XMTUyMzg1NTA0.html'},
      {video_url:'http://v.youku.com/v_show/id_XMTUyMzg1MjQ4.html'},
      {video_url:'http://v.youku.com/v_show/id_XMTUyMzg1MzYw.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTM4NTg4.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTM5MTg0.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTQ1Mzky.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg3MDUxMDM2.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTUyNTMy.html'},
      {video_url:'http://v.youku.com/v_show/id_XMzY2MDc1MzY0.html'},
      {video_url:'http://v.youku.com/v_show/id_XMTc1NDA4Mjcy.html'},
      {video_url:'http://v.youku.com/v_show/id_XMjgyMTY0MzY0.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTQ3MTA4.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTQ1OTYw.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTUyNTE2.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTUwNjUy.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTUyNTA0.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTQ0MTU2.html'},
      {video_url:'http://v.youku.com/v_show/id_XNDY5MzExMTA0.html'},
      {video_url:'http://v.youku.com/v_show/id_XNDUxOTgzMTg0.html'},
      {video_url:'http://v.youku.com/v_show/id_XNDg5Mjk5MDA4.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTUxMTQw.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTIzMTUyMzY4.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTIzMTU1ODEy.html'},
      {video_url:'http://v.youku.com/v_show/id_XMzYxODAzNDE2.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTUyMTIw.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTIzMTU4MjYw.html'},
      {video_url:'http://v.youku.com/v_show/id_XNDM3ODM1Njg0.html'},
      {video_url:'http://v.youku.com/v_show/id_XNDc0MDQ3NDg=.html'},
      {video_url:'http://v.youku.com/v_show/id_XMTc1MjQyNDA0.html'},
      {video_url:'http://v.youku.com/v_show/id_XMjc4NjUzMjA0.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTUxMzgw.html'},
      {video_url:'http://v.youku.com/v_show/id_XMTYyNTg2MzAw.html'},
      {video_url:'http://v.youku.com/v_show/id_XNDM3MzYxNzMy.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTI5MjcyMTA4.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTI4ODczOTE2.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTExNDQyODQw.html'},
      {video_url:'http://v.youku.com/v_show/id_XMjk4NzI3MzY0.html'},
      {video_url:'http://v.youku.com/v_show/id_XMzM1NTk0NDQw.html'},
      {video_url:'http://v.youku.com/v_show/id_XMjU3NjE2OTg4.html'},
      {video_url:'http://v.youku.com/v_show/id_XNDIxOTczNzYw.html'},
      {video_url:'http://v.youku.com/v_show/id_XNDU0ODg4NjQ0.html'},
      {video_url:'http://v.youku.com/v_show/id_XNDU2ODQzODI4.html'},
      {video_url:'http://v.youku.com/v_show/id_XNDY0MzAwMjgw.html'},
      {video_url:'http://v.youku.com/v_show/id_XNDg2Mjk0MTEy.html'},
      {video_url:'http://v.youku.com/v_show/id_XNDU2NTc2NDQw.html'},
      {video_url:'http://v.youku.com/v_show/id_XMTc4OTQxNzUy.html'},
      {video_url:'http://v.youku.com/v_show/id_XMTQ5MzYxNzA4.html'},
      {video_url:'http://v.youku.com/v_show/id_XMTUyMzg1Njg4.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTY4OTU1NjA4.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTYyNDQ5ODI0.html'},
      {video_url:'http://v.youku.com/v_show/id_XNDU4ODgzNTk2.html'},
      {video_url:'http://v.youku.com/v_show/id_XNDQ3NDc0NDg4.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTE4MDYxMjA4.html'},
      {video_url:'http://v.youku.com/v_show/id_XMjk5Mzc4Mjk2.html'},
      {video_url:'http://v.youku.com/v_show/id_XNDIzMTg5MDYw.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTU0Mzk0NTIw.html'},
      {video_url:'http://v.youku.com/v_show/id_XMjI1MTY4NDI0.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTYzMDU2NzI4.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTY5OTgxMzEy.html'},
      {video_url:'http://v.youku.com/v_show/id_XMzIwODM2MDgw.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTUxNzE2.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTg2OTQ5MzUy.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTgxMzA1MzY0.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTkxNzkzNzg0.html'},
      {video_url:'http://v.youku.com/v_show/id_XMjUxMDg3Mg.html'},
      {video_url:'http://v.youku.com/v_show/id_XMzg2OTkyNzcy.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTkwNDUyMTY4.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTkyNDgzNjUy.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTkyNDg0MTUy.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTkyNTMzOTI0.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTkyNTMxODk2.html'},
      {video_url:'http://v.youku.com/v_show/id_XMjI4OTI0NzU2.html'},
      {video_url:'http://v.youku.com/v_show/id_XMjM1Nzc2MzU2.html'},
      {video_url:'http://v.youku.com/v_show/id_XMjM0MzQ2NzY0.html'},
      {video_url:'http://v.youku.com/v_show/id_XMTQ5MTAwOTA4.html'},
      {video_url:'http://v.youku.com/v_show/id_XMTUwMzEwNzc2.html'},
      {video_url:'http://v.youku.com/v_show/id_XMjQ0NTI0NDQw.html'},
      {video_url:'http://v.youku.com/v_show/id_XMTA5Mzc3MDM2.html'},
      {video_url:'http://v.youku.com/v_show/id_XNTk4NjE5MjE2.html'}

                          ])

if videos.all?(&:save)
  puts "categories saved"
else
  puts "categories saved failed"
end
