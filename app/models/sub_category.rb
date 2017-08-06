class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :logs, dependent: :destroy

  validates :name, length: { minimum: 1, maximum: 50 }

  def name_with_order
    "#{order}: #{name}"
  end

  def name_with_long_order
    "#{get_category_order}#{order}: #{name}"
  end

  private

    def get_category_order
      Category.find(category_id).order
    end
end
