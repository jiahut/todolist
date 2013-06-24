json.array!(@users) do |user|
  json.extract! user, :name, :passwd, :email, :salt
  json.url user_url(user, format: :json)
end