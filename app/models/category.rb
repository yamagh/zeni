class Category < ApplicationRecord
  belongs_to :user
  has_many :sub_categories, dependent: :destroy

  validates :name, length: { minimum: 1, maximum: 50 }

  def name_with_order
    "#{order}: #{name}"
  end
end
