json.extract! user, :id, :name, :email, :no_hp, :gender, :account_id, :created_at, :updated_at
json.url user_url(user, format: :json)
