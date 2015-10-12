json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :city, :state, :education, :specialty
  json.url user_url(user, format: :json)
end
