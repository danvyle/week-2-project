class FavoritesController < ApplicationController
before_action :redirect_user
    # before_action :set_favorite, only: [:show, :edit, :create, :update]
    #
    def index
      @favorites = Favorite.all.count
    end
    #

    def create
      @current_user = current_user.id
      @recipe = params[:recipe_id]
      input = {user_id: @current_user, recipe_id: @recipe}
      @favorite = Favorite.new(input)
      if @favorite.save
        redirect_to recipe_path(@recipe)
      else
        render :new
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
