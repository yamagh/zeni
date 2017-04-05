json.extract! log, :id, :user_id, :logged_at, :ammount, :is_expence, :account_id, :sub_category_id, :store_id, :item, :memo, :created_at, :updated_at
json.url log_url(log, format: :json)
