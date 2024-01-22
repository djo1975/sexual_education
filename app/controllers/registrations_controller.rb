# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      if resource.persisted?
        render json: { message: 'You must confirm your email. A confirmation link has been sent to your email address.' } and return
      end
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :gender, :age, :country, :occupation, :email, :password, :password_confirmation)
  end
end
