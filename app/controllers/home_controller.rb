class HomeController < ApplicationController
  def index
  	 @tickets = Ticket.where('rut = ?', "#{params[:search]}")
  end
end

