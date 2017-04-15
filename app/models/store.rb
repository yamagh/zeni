class Store < ApplicationRecord
  belongs_to :user
  has_many :logs, dependent: :destroy
end
