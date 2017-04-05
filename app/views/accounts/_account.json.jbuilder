json.extract! account, :id, :user_id, :name, :is_disabled, :order, :created_at, :updated_at
json.url account_url(account, format: :json)
