class Step < ApplicationRecord
  belongs_to :recipe
  validates :step_introduction, presence: true
end
