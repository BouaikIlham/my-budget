class Transaction < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :category
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
