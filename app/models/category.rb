class Category < ApplicationRecord
  belongs_to :user
  has_many :category_operations, dependent: :delete_all
  has_many :operations, through: :category_operations
  validates :name, presence: true
  validates :icon, presence: true


  def total_amount
    operations.pluck(:amount).inject(:+)
  end
end
