# confirmations_controller.rb
class ConfirmationsController < Devise::ConfirmationsController
  respond_to :json

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      render json: { success: true, message: "Your account was successfully confirmed." }
    else
      render json: { success: false, errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
