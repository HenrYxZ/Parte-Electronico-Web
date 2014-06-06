json.array!(@users) do |user|
  json.extract! user, :id, :name, :password, :rut, :mail, :phone, :position, :rank
  json.url user_url(user, format: :json)
end
