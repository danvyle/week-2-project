class IngredientsController < ApplicationController
    before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
    before_action :redirect_user

    def index
      @ingredients = Ingredient.all
    end

    def new
      @ingredient = Ingredient.new
    end

    def create
      # @recipe = Recipe.find(params[:id])

      @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
          byebug
          redirect_to ingredient_path(@ingredient)
        else
          render :new
        end
      end

    def update
      @ingredient.update(ingredient_params)
      redirect_to @ingredient
    end

    def destroy
      @ingredient.delete
      redirect_to ingredients_path
    end

    private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:description, :calorie, :recipe_id)
    end

end
