desc "Fetch videos part2"
task :fetch_video2 => :environment do

videos = Micropost.create([
                              #video part 2
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
                              {video_url:'http://v.youku.com/v_show/id_XNTI4ODczOTE2.html'}
                          ])
if videos.all?(&:save)
  puts "categories2 saved"
else
  puts "categories saved failed"
end
end