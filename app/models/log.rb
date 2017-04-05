class Log < ApplicationRecord
  belongs_to :user
  belongs_to :account
  belongs_to :sub_category
  belongs_to :store
end
