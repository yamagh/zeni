json.extract! sub_category, :id, :category_id, :name, :is_disabled, :order, :created_at, :updated_at
json.url sub_category_url(sub_category, format: :json)
