class ApplicationController < ActionController::Base
	include Pundit
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:firstname, :lastname, :username, :email, :password, :password_confirmation) }
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname, :lastname, :username, :email, :password, :password_confirmation, :terms) }
  	devise_parameter_sanitizer.for(:account_update){ |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password) }
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def admin_types
		['AdminUser']
	end

private
	def user_not_authorized
		flash[:alert] = "You are not authorized to view this page"
		redirect_to(request.referrer || root_path)
	end
end
