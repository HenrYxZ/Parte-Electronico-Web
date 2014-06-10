class ApiController < ApplicationController
	respond_to :json
	before_filter :restrict_access
	skip_before_filter :login

	##==========================================================================
	# Se usa para conectarse con una cuenta por primera vez y le manda el API
	# Token al Usuario movil. El problema de seguridad es que al mandarlo 
	# alguien podría recuperar este API Token.
	# Además alguien podría recibir el password enviado.
	#---------------------------------------------------------------------------
	# /api/login/:username/:password
	##==========================================================================
	def login
		@user = User.find_by_username(params[:username])
		
		if not @user
			user_not_found = 'No existe este usuario'
			render json: {error: true, message: user_not_found}, status: 404
			return
		elsif  @user.password_digest != params[:password]
			wrong_password = 'Contraseña incorrecta'
			render json: {error: true, message: wrong_password}, status: 400
		else
			access_token = @user.api_key.access_token
			render json: {access_token: access_token, authenticated: true}
		end
		# TODO: Usar OpenSSL para esto
	end

	def users
		@users = User.all
		render json: (@users.map { |u| u.as_json }).to_json
	end

	private
	def restrict_access
	    api_key = ApiKey.find_by_access_token(params[:access_token])
	    head :unauthorized unless api_key
	end
end
