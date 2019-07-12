# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


100.times do
  Like.create(user_id: (1..20).to_a.sample, recipe_id: (1..60).to_a.sample)
end

100.times do
  Favorite.create(user_id: (1..20).to_a.sample, recipe_id: (1..60).to_a.sample)
end

# 10.times do
#   Recipe.create(title: Faker::Food.dish, source_url: nil, image_url: nil, user_id: (22..31).to_a.sample)
# end

200.times do
  Ingredient.create(description: Faker::Food.ingredient, calorie: (50..200).to_a.sample)
end

100.times do
  IngredientsRecipe.create(ingredient_id: (1..200).to_a.sample, recipe_id: (1..60).to_a.sample)
end


