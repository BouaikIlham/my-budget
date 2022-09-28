class CategoriesTransaction < ApplicationRecord
    belongs_to :Category
    belongs_to :transaction
end