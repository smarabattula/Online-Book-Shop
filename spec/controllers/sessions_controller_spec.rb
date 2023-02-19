require 'rails_helper'

RSpec.describe SessionsController do
  let(:user) {FactoryBot.create(:user)}

  describe "POST #create" do
    it "User with valid username and password" do
      post :create, params:{ :username => user.username, :password => user.password}
      expect(session[:user_id]).to eq(user.id)
    end
    it "User with valid username and invalid password" do
      post :create, params:{ :username => user.username, :password => 'invalid' }
      expect(flash.now[:alert]).to eq("username or password is invalid")
      expect(session[:user_id]).to be_nil
    end
    it "User with invalid username and valid password" do
      post :create, params:{ :username => 'invalid', :password => user.password }
      expect(flash.now[:alert]).to eq("username or password is invalid")
      expect(session[:user_id]).to be_nil
    end
  end
  describe "POST #destroy" do
    it "User with logged in session" do
      session[:user_id] = user.id
      post :destroy
      expect(session[:user_id]).to be_nil
    end
  end
end