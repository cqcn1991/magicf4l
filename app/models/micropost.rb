class Micropost < ActiveRecord::Base
  attr_accessible :content, :title, :video_url, :article_url, :user_id, :video_thumbnail_url

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






end
