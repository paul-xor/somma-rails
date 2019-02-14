json.extract! campaign, :id, :name, :due_start, :due_end, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)
