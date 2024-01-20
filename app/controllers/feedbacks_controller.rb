# app/controllers/feedbacks_controller.rb
class FeedbacksController < ApplicationController
    def index
      @feedbacks = Feedback.all
      render json: @feedbacks
    end
  
    def create
      @feedback = Feedback.new(feedback_params)
  
      if @feedback.save
        render json: @feedback, status: :created
      else
        render json: { errors: @feedback.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def feedback_params
      params.require(:feedback).permit(:user_id, :content)
    end
  end
  