class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :redirect_user

  def index
    @recipes = Recipe.all
  end

  def new
    @ingredients = Ingredient.all
    @recipe = Recipe.new
  end

  def edit
    @ingredients = Ingredient.all
  end

  def create
    @current_user = user_id 
    @recipe = Recipe.new(recipe_params)
      if @recipe.save
        redirect_to recipe_path(@recipe)
      else
        render :new
      end
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
    params.require(:recipe).permit(:title, :user_id, :source_url, :image_url)
  end

end
