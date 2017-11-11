class Log < ApplicationRecord
  belongs_to :user
  belongs_to :account
  belongs_to :sub_category
  belongs_to :store

  validates :ammount, numericality: { greater_than_or_equal_to: 0,
                                      less_than: 1_000_000_000_000_000 }
end
