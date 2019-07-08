class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def search
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
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

  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :user_id)
  end
end
