class Category < ApplicationRecord
  belongs_to :user
  has_many :sub_categories, dependent: :destroy

  validates :name, length: { minimum: 1 }
end
