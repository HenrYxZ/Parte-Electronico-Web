require 'csv'

class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  authorize_resource
  # GET /tickets
  # GET /tickets.json
  # GET /tickets.xls
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @infractions=@ticket.infractions
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ticket }
      else
        format.html { render action: 'new' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Parte modificado con éxito' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end

  # Este metodo ya no se usa
  def export_tickets
    @tickets = Ticket.all
    ticket_csv = CSV.generate(col_sep: ";") do |csv|
      csv << ["Folio", "Nombre", "Apellido", "Direccion", "Comuna", "Email",
       "Fecha", "Infracciones", "Descripcion", "Vehiculo", "Patente", "Costo", "Carabinero"]
      @tickets.each do |ticket|
        csv << [ticket.id, ticket.first_name, ticket.last_name, ticket.address, 
          ticket.location, ticket.email, ticket.date.strftime("%d/%m/%Y %I:%M%p"), 
          ticket.infractions.map { |e| e.type_of_infraction }.join(', '),
          ticket.description, ticket.vehicle, ticket.vehicle_plate, ticket.total_cost, ticket.user.name]
      end
    end
    send_data ticket_csv, type: 'text/csv', filename: 'partes.csv'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:vehicle_plate, :vehicle, :license_code, :date, :latitude, :longitude, :rut, :first_name, :last_name, :address, :email, :description)
    end
end
