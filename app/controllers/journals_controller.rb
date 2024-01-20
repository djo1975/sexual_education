# app/controllers/journals_controller.rb
class JournalsController < ApplicationController
  before_action :set_user, only: [:create]
  
  def index
    @journals = Journal.all
    render json: @journals
  end
  
  def create
    # Ako korisnik nije uneo tekst u zadnjih 48 sati, resetujemo counter
    if @user.journals.empty? || @user.journals.last.last_entry_date.nil? || @user.journals.last.last_entry_date < 2.days.ago.to_date
      counter = 1
    else
      counter = @user.journals.last.counter + 1
    end
  
    @journal = @user.journals.build(journal_params.merge(counter: counter, last_entry_date: Date.today))
  
    if @journal.save
      render json: @journal, status: :created
    else
      render json: @journal.errors, status: :unprocessable_entity
    end
  end
  
  private
  
  def journal_params
    params.require(:journal).permit(:content)
  end
  
  def set_user
    @user = User.find(params[:user_id])
  end
end
