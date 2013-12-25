class Note < ActiveRecord::Base
  attr_accessible :content, :public, :title, :user_id
  belongs_to :user
  has_many :comments
  validates :title, presence: true
end
