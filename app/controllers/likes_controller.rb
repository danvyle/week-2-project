class LikesController < ApplicationController
  # before_action :set_like, only: [:show, :edit, :create, :update]
  #
  def index
    @likes = Like.all.count
  end
  #

  def create
    @user = user.id
    @recipe = params[:recipe_id]
    likes = {user_id: @user, recipe_id: @recipe}
    @like = Like.new(likes)
    @like.save!
    if @like.save
      redirect_to user_path(@user)
    else
     redirect_to recipe_path
    end
  end

  #
  # def update
  #   @like.update(like_params)
  #   redirect_to recipe_path(@recipe)
  # end
  #
  #
  #
  #
  private

  def like_params
    params.require(:like).permit(:user_id, :recipe_id)
  end


end
