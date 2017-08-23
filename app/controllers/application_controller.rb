class ApplicationController < ActionController::Base
	include Pundit
  protect_from_forgery prepend: true, with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password) }
  	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname, :lastname, :username, :email, :password, :password_confirmation, :terms, :profile_picture) }
  	devise_parameter_sanitizer.permit(:account_update){ |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password, :profile_picture) }
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
