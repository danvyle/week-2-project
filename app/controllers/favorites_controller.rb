class FavoritesController < ApplicationController

    # before_action :set_favorite, only: [:show, :edit, :create, :update]
    #
    def index
      @favorites = Favorite.all.count
    end
    #

    def create
      @user = user.id
      @recipe = params[:recipe_id]
      favorites = {user_id: @user, recipe_id: @recipe}
      @favorite = Favorite.new(favorites)
      @favorite.save!
      if @favorite.save
        redirect_to user_path(@user)
      else
       redirect_to recipe_path
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
