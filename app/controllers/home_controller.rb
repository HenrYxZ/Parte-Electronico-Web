class HomeController < ApplicationController
  def index
  	 @tickets = Ticket.where('name = ?', "%#{params[:search]}%")
  end
end

