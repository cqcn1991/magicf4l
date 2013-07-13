class Micropost < ActiveRecord::Base

  attr_accessible :content, :title, :video_url, :article_url, :user_id, :video_thumbnail_url
  belongs_to :user
  mount_uploader :snapshot, SnapshotUploader

  def video_id
    if !self.video_url.empty?
      video_id = self.video_url.split("id_")[1]
      ampersandPosition = video_id.index("?f=")
      if ampersandPosition
        video_id = video_id[0..ampersandPosition-1]
      end
      video_id = video_id.delete(".html")

      video_id
    end
  end

  def logo
    response = HTTParty.get("http://v.youku.com/player/getPlayList/VideoIDS/#{self.video_id}/timezone/+08/version/5/source/out?password=&ran=2513&n=3")
    decode_response =  ActiveSupport::JSON.decode(response)

    decode_response['data'][0]['logo']
  end


  def take_snapshot
    file = Tempfile.new(["template_#{self.id.to_s}", 'jpg'], 'tmp', :encoding => 'ascii-8bit')
    file.write(IMGKit.new('http://baidu.com').to_jpg)
    file.flush
    self.snapshot = file
    self.save
    file.unlink
  end

  #def remote_thumbnail
  #  response = self.class.get("/versions/#{name}.json",
  #                            :client_id => { :email => "alan+thinkvitamin@carsonified.com" },
  #                            :video_id => { "Authorization" => "THISISMYAPIKEYNOREALLY"})
  #end






end
