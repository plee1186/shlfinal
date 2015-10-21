json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :address, :city, :state, :zip, :challenge
  json.url restaurant_url(restaurant, format: :json)
end
