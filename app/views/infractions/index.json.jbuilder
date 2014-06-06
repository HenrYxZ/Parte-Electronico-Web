json.array!(@infractions) do |infraction|
  json.extract! infraction, :id, :description, :latitude, :longitude, :address, :license_code
  json.url infraction_url(infraction, format: :json)
end
