class Post < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  validates :title, presence: true, length: {minimum: 3, maximum: 150}
  validates :body, presence: true, length: {minimum: 10, maximum: 5000}
  validates :campaign_id, presence: true
end
