class Ingredient < ApplicationRecord
  belongs_to :recipe

  validates :ingredient_name, presence: true
  validates :amount, presence: true
end
