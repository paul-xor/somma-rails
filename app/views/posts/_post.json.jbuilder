json.extract! post, :id, :title, :body, :post_date, :campaign_id, :created_at, :updated_at
json.url post_url(post, format: :json)
