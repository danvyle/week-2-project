class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :redirect_user

  def index
    @recipes = Recipe.all
  end

  def show
    @ingredients = Ingredient.all
  end

  def new
    @ingredients = Ingredient.all
    @recipe = Recipe.new
  end

  def edit
    @ingredients = Ingredient.all
  end

  def create
    @ingredients = Ingredient.all
    @current_user = current_user.id
    input = {title: params["recipe"]["title"], user_id: @current_user, image_url: params["recipe"]["image_url"], source_url: params["recipe"]["source_url"], ingredient_ids: params["recipe"]["ingredient_ids"]}
    @recipe = Recipe.new(input)
      @recipe.save
      redirect_to recipe_path(@recipe)
  end

  def update
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  def destroy
    @recipe.delete
    redirect_to recipes_path
  end

  def search
  end

  def search_results
    Recipe.get_recipes(params[:q])
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :user_id, :source_url, :image_url, ingredient_ids:[])
  end

end
