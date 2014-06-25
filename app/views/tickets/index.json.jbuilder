json.array!(@tickets) do |ticket|
  json.extract! ticket, :vehicle_plate, :vehicle, :license_code, :date, :latitude, :longitude, :rut,:first_name, :last_name, :address, :email, :user_id, :location, :description
  json.url ticket_url(ticket, format: :json)
end
