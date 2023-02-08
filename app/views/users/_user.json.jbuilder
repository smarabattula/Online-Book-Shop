json.extract! user, :id, :username, :password_digest, :name, :email, :address, :credit_card_number, :phone_number, :is_admin, :created_at, :updated_at
json.url user_url(user, format: :json)
