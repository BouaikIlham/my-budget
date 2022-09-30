class Operation < ApplicationRecord
  belongs_to :user
  has_many :category_operations, dependent: :delete_all
  has_many :categories, through: :category_operations
  validates :name, :amount, presence: true, length: { in: 1..100 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
