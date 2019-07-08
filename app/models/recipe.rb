class Recipe < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :favorites
  has_many :ingredients
end
