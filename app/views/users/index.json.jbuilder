json.array!(@users) do |user|
  json.extract! user, :id, :email, :fname, :lname, :gender, :yob
  json.url user_url(user, format: :json)
end
