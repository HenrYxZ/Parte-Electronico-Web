class PasswordResetsController < ApplicationController
  def new
  end

  def create
  admin = Admin.find_by_email(params[:email])
  admin.send_password_reset if admin
  redirect_to root_url, :notice => "Email enviado con instrucciones de recuperación de contraseña"
  end

  def edit
  @admin = Admin.find_by_password_reset_token!(params[:id])
  end
  
  def update
  @admin = Admin.find_by_password_reset_token!(params[:id])
  if @admin.password_reset_sent_at < 2.hours.ago
    redirect_to new_password_reset_path, :alert => "Recuperación de contraseña expirada"
  elsif @admin.update_attributes(admin_params)
    redirect_to root_url, :notice => "Contraseña cambiada"
  else
    render :edit
  end
end

def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation)
   end

end
