json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :municipality, :court, :infractor_name, :vehicle_plate, :vehicle, :citation_day
  json.url ticket_url(ticket, format: :json)
end
