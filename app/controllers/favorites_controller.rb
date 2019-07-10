class FavoritesController < ApplicationController

    # before_action :set_favorite, only: [:show, :edit, :create, :update]
    #
    def index
      @favorites = Favorite.all.count
    end
    #

    def create
      @favorite = Favorite.new(favorite_params)
      if @favorite.save
        redirect_to recipe_path(@recipe)
      else
       render :recipe_path(@recipe)
      end
    end

    #
    # def update
    #   @favorite.update(favorite_params)
    #   redirect_to recipe_path(@recipe)
    # end
    #
    #
    #
    #
    private

    def favorite_params
      params.require(:favorite).permit(:user_id, :recipe_id)
    end




end
