class Account < ApplicationRecord
  belongs_to :user
  has_many :logs, dependent: :destroy

  validates :name, length: { minimum: 1 }
end
