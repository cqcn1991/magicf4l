class Micropost < ActiveRecord::Base
  #include HTTParty
  #base_uri "https://openapi.youku.com/v2/videos/show.json"
  attr_accessible :content, :title, :video_url, :article_url, :user_id, :video_thumbnail_url

  mount_uploader :snapshot, SnapshotUploader

  after_create :take_snapshot

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
