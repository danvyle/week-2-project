class User < ApplicationRecord
  has_many :recipes
  has_many :likes
  has_many :favorites
  has_many :ingredients, through: :recipes


  validates :username, {presence: true, uniqueness: true}
  has_secure_password
end
