class Site < ActiveRecord::Base
  attr_accessible :category_id, :description, :site_url, :title
  belongs_to :category

end
