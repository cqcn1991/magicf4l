class Comment < ActiveRecord::Base
  attr_accessible :content
  validates :content, presence: true

  belongs_to :note
  belongs_to :user
end
