require './config/environment'

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :favorites
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes
  accepts_nested_attributes_for :ingredients

  validates :title, uniqueness: true

  def self.get_recipes(input)
        recipe = RestClient.get("https://www.food2fork.com/api/search?key=#{API_KEY}&q=#{input}") #input by ingredient
        parsed_recipes = JSON.parse(recipe)

        parsed_recipes["recipes"].each do |recipe|
          rj = Recipe.create(title: recipe["title"], source_url: recipe["source_url"], image_url: recipe["image_url"], user_id: (1..10).to_a.sample)
        end
  end

  def self.most_likes
    self.left_joins(:likes)
    .group(:id)
    .order('COUNT(likes.id) DESC')
    .limit(5)
  end


end
