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

        # inputID = parsed_recipes["recipes"][0]["recipe_id"]

        # recipeID = RestClient.get("https://www.food2fork.com/api/get?key=#{API_KEY}&rId=#{inputID}")#input recipe id to look up ingredients
        # parsed_recipesID = JSON.parse(recipeID)
  
        # @ingredients = parsed_recipesID["recipe"]["ingredients"].map(&:inspect).join(', ')

        parsed_recipes["recipes"].each do |recipe|
          rj = Recipe.create(title: recipe["title"], source_url: recipe["source_url"], image_url: recipe["image_url"], user_id: (1..10).to_a.sample)
          # ingredientrj = Ingredient.create(description: @ingredients, calorie: nil, recipe: rj )
        end
    end
end
