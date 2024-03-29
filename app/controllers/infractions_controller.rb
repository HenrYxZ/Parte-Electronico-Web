class InfractionsController < ApplicationController
  before_action :set_infraction, only: [:show, :edit, :update, :destroy]
  authorize_resource

  # GET /infractions
  # GET /infractions.json
  def index
    @infractions = Infraction.all
  end

  # GET /infractions/1
  # GET /infractions/1.json
  def show
  end

  # GET /infractions/new
  def new
    @infraction = Infraction.new
  end

  # GET /infractions/1/edit
  def edit
  end

  # POST /infractions
  # POST /infractions.json
  def create
    @infraction = Infraction.new(infraction_params)

    respond_to do |format|
      if @infraction.save
        format.html { redirect_to @infraction, notice: 'Infraction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @infraction }
      else
        format.html { render action: 'new' }
        format.json { render json: @infraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /infractions/1
  # PATCH/PUT /infractions/1.json
  def update
    respond_to do |format|
      if @infraction.update(infraction_params)
        format.html { redirect_to @infraction, notice: 'Infraction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @infraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /infractions/1
  # DELETE /infractions/1.json
  def destroy
    @infraction.destroy
    respond_to do |format|
      format.html { redirect_to infractions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_infraction
      @infraction = Infraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def infraction_params
      params.require(:infraction).permit(:type,:cost)
    end
end
