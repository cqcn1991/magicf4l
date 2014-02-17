# encoding: UTF-8
class Micropost < ActiveRecord::Base
  attr_accessible :content, :title, :video_url, :article_url, :user_id, :video_thumbnail_url, :video_logo_url, :video_id,
                  :username, :video, :important
  belongs_to :user
  #mount_uploader :snapshot, SnapshotUploader
  has_reputation :likes, source: :user, aggregated_by: :sum
  validates_presence_of :title
  before_validation :categorize, on: :create

  validates_uniqueness_of :video_id, allow_blank: true
  validates :video_url, presence: true, uniqueness: true

  default_scope order('created_at desc')

  def auto_link
    if self.video?
       self
    else
      self.video_url
    end
  end

  def categorize
    smart_add_url_protocol
    if self.is_video?
      get_video_id
      get_thumbnail
      self.video = true
    else
      get_title
      get_source
    end
  end

  def smart_add_url_protocol
    unless self.video_url[/\Ahttp:\/\//] || self.video_url[/\Ahttps:\/\//]
      self.video_url = "http://#{self.video_url}"
    end
  end

  def get_source
    uri = URI.parse(self.video_url)
    uri = URI.parse("http://#{url}") if uri.scheme.nil?
    host = uri.host.downcase
    host.start_with?('www.') ? host[4..-1] : host
    self.source = host
  end

  def is_video?
    if self.video_url.include?("youku")  && self.video_url.include?("id_") && !self.video_url.include?("playlist")
        true
    else
       false
    end
  end

  def is_taobao?
    if self.video_url.include?("item.taobao")  && self.video_url.include?("id=")
      true
    else
      false
    end
  end

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
      #video_id = self.video_url.split("id_")[1]
      #ampersandPosition = video_id.index("?f=")
      #if ampersandPosition
      #  video_id = video_id[0..ampersandPosition-1]
      #end
      #self.video_id = video_id.delete(".html")

      # user发布micropost,里面包含了video_url,用video_url来得到video_id
      video_id = self.video_url.split("id_")[1]
      ampersandPosition = video_id.index(".html")
      self.video_id = video_id[0..ampersandPosition-1]

      #get_logo_url & title
      response = HTTParty.get("http://v.youku.com/player/getPlayList/VideoIDS/#{self.video_id}/timezone/+08/version/5/source/out?password=&ran=2513&n=3")
      decode_response =  ActiveSupport::JSON.decode(response)
      self.title = decode_response['data'][0]['title']
      self.video_logo_url = decode_response['data'][0]['logo']
      if !self.user
         self.username =  decode_response['data'][0]['username']
      end
    end
  end

  def get_title
    url = self.video_url
    doc = Nokogiri::HTML(open(url))
    self.title = doc.css("title").text
    if self.is_taobao?
      self.title = self.title.delete("-淘宝网")
      self.video_logo_url = doc.at_css("#J_ImgBooth")["data-src"]
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
