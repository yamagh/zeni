json.extract! category, :id, :user_id, :name, :is_disabled, :order, :created_at, :updated_at
json.url category_url(category, format: :json)
