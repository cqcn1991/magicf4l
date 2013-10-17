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

  def domain
    url=self.address
    uri = URI.parse(url)
    uri = URI.parse("http://#{url}") if uri.scheme.nil?
    host = uri.host.downcase
    host.start_with?('www.') ? host[4..-1] : host
  end


end
