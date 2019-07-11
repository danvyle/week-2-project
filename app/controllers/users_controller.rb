class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :redirect_user, only: [:index, :show, :edit]
  # before_action :redirect_user

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to user_path(@user)
      else
        render :new
      end
    end


  def update
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    @user.delete
    redirect_to users_path
  end
#
# def user_favorites
#  @user.favorites.each do |favorites|
#    recipe = Recipe.find_by(favorites.recipe_id)
#      recipe.ingredient.each do |item|
#          item.description
#         binding.pry
#      end
#  end
# end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
