# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# RestClient.get("https://www.food2fork.com/api/search?key=#{API_KEY}&q=#{input}") #input by ingredient
# parsed_recipes = JSON.parse(recipe)
#
# # def get_recipes(input)
#     recipe = RestClient.get("https://www.food2fork.com/api/search?key=#{API_KEY}&q=chicken") #input by ingredient
#     parsed_recipes = JSON.parse(recipe)
#
#     inputID = parsed_recipes["recipes"][0]["recipe_id"]
#
#     recipeID = RestClient.get("https://www.food2fork.com/api/get?key=#{API_KEY}&rId=#{inputID}")#input recipe id to look up ingredients
#     parsed_recipesID = JSON.parse(recipeID)
#
#     ingredientID = parsed_recipesID["recipe"]["ingredients"].join(",")
#     parsed_recipes["recipes"].each do |recipe|
#     recipe_1 = Recipe.new(name: recipe["title"], ingredients:ingredientID)
#     recipe_1.save
#
#     end
# end
# get_recipes

10.times do
  Ingredient.create(description: Faker::Food.ingredient, calorie: (13..500).to_a.sample)
end
