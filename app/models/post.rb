class Post < ApplicationRecord
  belongs_to :campaign
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :body, presence: true, length: {minimum: 10, maximum: 5000}
  validates :campaign_id, presence: true
end
