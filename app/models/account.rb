class Account < ApplicationRecord
  belongs_to :user
  has_many :logs, dependent: :destroy

  validates :name, length: { minimum: 1, maximum: 50 }

  def name_with_order
    "#{order}: #{name}"
  end
end
