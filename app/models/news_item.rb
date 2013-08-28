class NewsItem < ActiveRecord::Base
  attr_accessible :address, :description, :title
  validates_presence_of :address, :title
  belongs_to :user

  before_validation :get_title, on: :create

  def get_title
    url = self.address
    doc = Nokogiri::HTML(open(url))
    self.title = doc.css("title").text

  end


end
