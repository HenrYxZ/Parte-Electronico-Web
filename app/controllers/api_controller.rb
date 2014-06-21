class ApiController < ApplicationController
	respond_to :json
	before_filter :restrict_access, except: :login
	protect_from_forgery except: [:login, :new_ticket]

	##==========================================================================
	# Se usa para conectarse con una cuenta por primera vez y le manda el API
	# Token al Usuario movil. El problema de seguridad es que al mandarlo 
	# alguien podría recuperar este API Token.
	# Además alguien podría recibir el password enviado.
	#---------------------------------------------------------------------------
	# /api/login/:username/:password
	##==========================================================================
	def login
		@user = User.find_by_username(login_params[:username])
		
		if not @user
			user_not_found = 'No existe este usuario'
			render json: {error: true, message: user_not_found}, status: 404
			return
		elsif  not @user.authenticate(login_params[:password_digest]) 
			wrong_password = 'Contraseña incorrecta'
			render json: {error: true, message: wrong_password}, status: 400
		else
			access_token = @user.api_key.access_token
			render json: {access_token: access_token, authenticated: true}
		end
		# TODO: Usar OpenSSL para esto
	end

	##==========================================================================
	# Envía los usuarios que hay en la base de datos
	#---------------------------------------------------------------------------
	# /api/users/:access_token/:password
	##==========================================================================

	def users
		@users = User.all
		render json: (@users.map { |u| u.as_json(except: :password) }).to_json
	end

	def new_ticket
		@ticket = Ticket.new()
		@ticket.address = ticket_params[:address]
		@ticket.date = Time.at(ticket_params[:date]).to_datetime
		@ticket.description = ticket_params[:description]
		@ticket.email = ticket_params[:email]
		@ticket.first_name = ticket_params[:firstName]
		@ticket.last_name = ticket_params[:lastName]
		@ticket.license_code = ticket_params[:licenceCode]
		@ticket.vehicle_plate = ticket_params[:licensePlate]
		@ticket.location = ticket_params[:location]
		@ticket.longitude = ticket_params[:longitude]
		@ticket.latitude = ticket_params[:latitude]
		@ticket.rut = ticket_params[:rut]
		@ticket.vehicle = ticket_params[:vehicle]

		@ticket.add_infractions(ticket_params[:violations])
		# not implemented @ticket.add_pictures(ticket_params[:pictures])

		if @ticket.save
			render json: 'Parte creado con exito', status: :created
		else
			render json: @ticket.errors, status: :unprocessable_entity
		end
	end

	private
	def restrict_access
	    api_key = ApiKey.find_by_access_token(params[:access_token])
	    head :unauthorized unless api_key
	end

	def login_params
		params.permit(:username, :password_digest)
	end

	def ticket_params
		params.permit(:address, :date, :description, :email, :firstName, :lastName, :licenceCode, :licensePlate, :location, :longitude, :latitude, :rut, :vehicle, :violations, :pictures)
	end
end
