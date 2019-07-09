require_relative '/Users/renierdelacruz/Desktop/week-2-project/config/environment.rb'

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :favorites
  has_many :ingredients

  def self.get_recipes(input)
        byebug
        recipe = RestClient.get("https://www.food2fork.com/api/search?key=#{API_KEY}&q=#{input}") #input by ingredient
        parsed_recipes = JSON.parse(recipe)
    
        inputID = parsed_recipes["recipes"][0]["recipe_id"]
    
        recipeID = RestClient.get("https://www.food2fork.com/api/get?key=#{API_KEY}&rId=#{inputID}")#input recipe id to look up ingredients
        parsed_recipesID = JSON.parse(recipeID)
    
        ingredientID = parsed_recipesID["recipe"]["ingredients"]
        parsed_recipes["recipes"].each do |recipe|
        recipe_1 = Recipe.new(title: recipe["title"], ingredients:ingredientID)
        recipe_1.save
        end
    end
end