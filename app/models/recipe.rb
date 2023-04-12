class Recipe < ApplicationRecord
  has_one_attached :recipe_image
  # belongs_to :user, :category
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true
end
