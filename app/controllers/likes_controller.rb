class LikesController < ApplicationController
  before_action :redirect_user

  def index
    @likes = Like.all.count
  end
  #

  def create
    @current_user = current_user.id
    @recipe = params[:recipe_id]
    input = {user_id: @current_user, recipe_id: @recipe}
    @like = Like.new(input)
    if @like.save
      redirect_to recipe_path(@recipe)
    else
     render :new
    end
  end

  # def create
  #     @user = current_user.id
  #     @product = params[:product_id]
  #     likes = {user_id: @user, product_id: @product}
  #     @like = Like.new(likes)
  #
  #     @like.save!
  #     if @like.save
  #       redirect_to user_path(@user)
  #     else
  #      redirect_to product_path
  #     end
  #   end
  # #
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
