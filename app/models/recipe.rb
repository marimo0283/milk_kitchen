class Recipe < ApplicationRecord
  has_one_attached :recipe_image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :serving, presence: true
  validates :recipe_image, attached_file_presence: true

  belongs_to :user
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :category

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "id", "introduction", "name", "serving", "updated_at", "user_id"]
  end

end
