json.extract! account, :id, :username, :password, :role, :created_at, :updated_at
json.url account_url(account, format: :json)
