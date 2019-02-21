class Post < ApplicationRecord
  after_create :to_facebook
  belongs_to :campaign
  belongs_to :user
  validates :title, presence: true, length: {minimum: 3, maximum: 150}
  validates :body, presence: true, length: {minimum: 10, maximum: 5000}
  validates :campaign_id, presence: true

  def to_facebook
    
    if post_on_facebook == true
      self.user.fb_post_on_page(self.body)
    end
  end
end
