# app/controllers/confirmations_controller.rb
class ConfirmationsController < Devise::ConfirmationsController
    # private
  
    # def after_confirmation_path_for(resource_name, resource)
    #   sign_in(resource) # Ovo će automatski prijaviti korisnika nakon potvrde e-pošte
    #   root_path # Ili postavi na neku drugu putanju na koju želiš preusmeriti korisnika
    # end
  end
  