class LikesController < ApplicationController
  # before_action :set_like, only: [:show, :edit, :create, :update]
  #
  def index
    @likes = Like.all.count
  end
  #

  def create
    @like = Like.new(like_params)
    if @like.save
      redirect_to recipe_path(@recipe)
    else
     render :new
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
