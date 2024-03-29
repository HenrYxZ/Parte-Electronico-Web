class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Acceso denegado"
  redirect_to root_url
  end

private

	def current_user
  		@current_user ||= Admin.find(session[:admin_id]) if session[:admin_id]
	end	

end
