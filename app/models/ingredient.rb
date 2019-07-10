class Ingredient < ApplicationRecord
  belongs_to :recipe
  validates :description, uniqueness: true
end
