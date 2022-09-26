class User < ApplicationRecord
  has_many :categories
  has_many :transactions
  validates :measurement_unit, presence: true
end
