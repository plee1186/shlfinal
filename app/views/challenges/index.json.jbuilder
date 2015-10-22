json.array!(@challenges) do |challenge|
  json.extract! challenge, :id, :name, :description, :restaurant, :address, :city, :state, :zip
  json.url challenge_url(challenge, format: :json)
end
