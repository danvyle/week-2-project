class Recipe < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :favorites
  has_many :ingredients

  validates :title, uniqueness: true

  def self.get_recipes(input)
        recipe = RestClient.get("https://www.food2fork.com/api/search?key=#{API_KEY}&q=#{input}") #input by ingredient
        parsed_recipes = JSON.parse(recipe)

        inputID = parsed_recipes["recipes"][0]["recipe_id"]

        recipeID = RestClient.get("https://www.food2fork.com/api/get?key=#{API_KEY}&rId=#{inputID}")#input recipe id to look up ingredients
        parsed_recipesID = JSON.parse(recipeID)

        ingredientID = parsed_recipesID["recipe"]["ingredients"]
        sourceUrl = parsed_recipesID["recipe"]["source_url"]
        imgUrl = parsed_recipesID["recipe"]["image_url"]

        parsed_recipes["recipes"].each do |recipe|
          recipeTest = Recipe.create(title: recipe["title"], source_url:sourceUrl, image_url:imgUrl, user: current_user.id)
          ingredientTest = Ingredient.create(description:ingredientID, calorie: nil, recipe: recipeTest)
        end
    end
end
