# encoding: UTF-8
class Micropost < ActiveRecord::Base
  attr_accessible :content, :title, :video_url, :article_url, :user_id, :video_thumbnail_url, :video_logo_url, :video_id
  belongs_to :user
  #mount_uploader :snapshot, SnapshotUploader
  has_reputation :likes, source: :user, aggregated_by: :sum
  #validates_presence_of :title
  before_validation :get_thumbnail, :get_video_id, on: :create

  validates_uniqueness_of :video_id


  def get_thumbnail
    url = self.video_url
    doc = Nokogiri::HTML(open(url))
    #self.title = doc.css("title").text.delete("—在线播放—优酷网，视频高清在线观看")

    #get thumbnail_url
    video_thumbnail_url =  doc.css("a#s_qq_haoyou")[0]['href']
    video_thumbnail_url =  video_thumbnail_url.split("pics=")[1]
    self.video_thumbnail_url = video_thumbnail_url.split("&site=")[0]
  end

  def get_video_id
    if !self.video_url.empty?
      video_id = self.video_url.split("id_")[1]
      ampersandPosition = video_id.index("?f=")
      if ampersandPosition
        video_id = video_id[0..ampersandPosition-1]
      end
      self.video_id = video_id.delete(".html")

      #get_logo_url & title
      response = HTTParty.get("http://v.youku.com/player/getPlayList/VideoIDS/#{self.video_id}/timezone/+08/version/5/source/out?password=&ran=2513&n=3")
      decode_response =  ActiveSupport::JSON.decode(response)
      self.title = decode_response['data'][0]['title']
      self.video_logo_url = decode_response['data'][0]['logo']
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

  def self.to_csv
    CSV.generate do |csv|
      sub_column_names = ['id', 'video_url', 'video_id', 'content']
      csv << sub_column_names
      all.each do |product|
        csv << product.attributes.values_at(*sub_column_names)
      end
    end
  end

end
