# app/controllers/questions_controller.rb
class QuestionsController < ApplicationController
    before_action :set_user, only: [:create]
  
    def index
      @questions = Question.all
      render json: @questions
    end
  
    def create
      @question = @user.questions.build(question_params)
  
      if @question.save
        render json: @question, status: :created
      else
        render json: @question.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def question_params
      params.require(:question).permit(:content)
    end
  
    def set_user
      # Prikazano je kako možete pronaći korisnika na osnovu user_id parametra
      @user = User.find(params[:user_id])
    end
  end
  