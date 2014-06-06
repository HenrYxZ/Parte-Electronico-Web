json.array!(@admins) do |admin|
  json.extract! admin, :id, :email, :password
  json.url admin_url(admin, format: :json)
end
