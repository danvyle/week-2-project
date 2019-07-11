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
          rj = Recipe.create(title: recipe["title"], source_url: recipe["source_url"], image_url: recipe["image_url"], user_id: (22..31).to_a.sample)
        end
  end

  def self.most_likes
    # new_arr = []
    # self.all.each do |recipe|
    #   likes = recipe.likes
    #   new_arr << {recipe.title => likes.count}
    # end
    # sorted_array = new_arr.sort_by do  |key,value|
    #   byebug
    #   value
    # end
    self.left_joins(:likes)
    .group(:id)
    .order('COUNT(likes.id) DESC')
    .limit(1)
  end


end
