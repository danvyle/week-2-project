class User < ApplicationRecord
  has_many :recipes
  has_many :likes
  has_many :favorites
  has_many :ingredients, through: :recipes
end