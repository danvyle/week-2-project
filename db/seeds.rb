# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do
  Like.create(recipe_id: (1..20).to_a.sample, user_id: (1..10).to_a.sample)
end

10.times do
  Favorite.create(recipe_id: (1..20).to_a.sample, user_id: (1..10).to_a.sample)
end

40.times do
  Ingredient.create(description: Faker::Food.ingredient, calorie: (13..500).to_a.sample, recipe_id: (10..20).to_a.sample)
end
