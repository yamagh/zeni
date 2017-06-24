class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :logs, dependent: :destroy

  validates :name, length: { minimum: 1, maximum: 50 }
end
