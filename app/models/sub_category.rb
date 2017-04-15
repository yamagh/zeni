class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :logs, dependent: :destroy
end
