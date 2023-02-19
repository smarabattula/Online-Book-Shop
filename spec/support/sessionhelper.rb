module SessionHelper
def sign_in(user)
  session[:user_id] = BCrypt::Password.create(user.id)
end
end