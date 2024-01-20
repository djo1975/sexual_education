# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  before_action :set_like, only: [:show, :update, :destroy]

  # GET /likes
  def index
    @likes = Like.all
    render json: @likes
  end

  # POST /likes
  def create
    @like = Like.new(like_params)

    if @like.save
      render json: @like, status: :created
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_like
    @like = Like.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def like_params
    params.require(:like).permit(:user_id, :question_id, :comment_id, :feedback_id)
  end
end
