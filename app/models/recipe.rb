require './config/environment'

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :favorites
  has_many :ingredients

  validates :title, uniqueness: true

  def self.get_recipes(input)
        recipe = RestClient.get("https://www.food2fork.com/api/search?key=#{API_KEY}&q=#{input}") #input by ingredient
        parsed_recipes = JSON.parse(recipe)
        parsed_recipes["recipes"].each do |recipe|
          rj = Recipe.create(title: recipe["title"], source_url: recipe["source_url"], image_url: recipe["image_url"], user_id: (22..31).to_a.sample)
        end
  end
end
