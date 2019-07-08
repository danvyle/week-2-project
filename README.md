# README

API Keys: API_KEY='ea1fdb321af9211004f4c16ceca8c9fd'
API=KEY'f0a6e30fcf13978cb68ded50bb14bd43'
API_KEY='63f0ac735276c8f1081b27b4f49a91db'
API_KEY='5ba073d1aba03456f27965cabbb29817'


def get_recipes(input)
    recipe = RestClient.get("https://www.food2fork.com/api/search?key=#{API_KEY}&q=#{params[:q]}") #input by ingredient
    parsed_recipes = JSON.parse(recipe)

    inputID = parsed_recipes["recipes"][0]["recipe_id"]

    recipeID = RestClient.get("https://www.food2fork.com/api/get?key=#{API_KEY}&rId=#{inputID}")#input recipe id to look up ingredients
    parsed_recipesID = JSON.parse(recipeID)

    ingredientID = parsed_recipesID["recipe"]["ingredients"].join(",")
    parsed_recipes["recipes"].each do |recipe|
    recipe_1 = Recipe.new(name: recipe["title"], ingredients:ingredientID)
    recipe_1.save

    end
end
get_recipes
