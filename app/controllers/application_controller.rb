class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
# 
#   # add name to devise signup
#   before_filter :configure_permitted_parameters, if: :devise_controller?
# 
#   protected
# 
#   def configure_permitted_parameters
#     puts params[:actions]
#     if params[:actions] == 'create'
#       devise_parameter_sanitizer.for(:sign_up) {
#         |u| u.permit([:name, :email, :password, :password_confirmation])
#       }
#     end
#   end
end
