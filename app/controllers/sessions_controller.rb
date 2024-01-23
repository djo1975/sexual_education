class SessionsController < ApplicationController
    before_action :authenticate_user!
    
    def check_authentication
      respond_to do |format|
        format.json { render json: { user: current_user, token: current_user.authentication_token } }
          end
    end
  
    # Dodajte sledeći kod
    def create
        super do |resource|
          if resource.persisted?
            sign_in(resource_name, resource)
    
            session_cookie = response.headers['Set-Cookie']
            puts "Session Cookie: #{session_cookie}" if session_cookie.present?
    
            render json: { user: resource }
            return
          end
        end
      end
  end
  