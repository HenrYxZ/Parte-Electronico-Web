class SessionsController < ApplicationController
  def new
  end

  def create

  	#admin = Admin.authenticate(params[:email], params[:password])
    admin = Admin.find_by_email(params[:email])
  	if admin
    	session[:admin_id] = admin.id
    	redirect_to root_url, :notice => "Sesión iniciada!"
  	else
    	flash.now.alert = "email o contraseña inválida"
    	render "new"
  	end
  end


  def destroy
  	session[:admin_id] = nil
  	redirect_to root_url, :notice => "Sesión cerrada!"
  end

end
