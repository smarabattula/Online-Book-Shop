require 'rails_helper'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.include SessionHelper, type: :controller
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    context "when user is an admin" do
      let(:admin) { create(:user, is_admin: true) }
      before { allow(controller).to receive(:current_user).and_return(admin) }

      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns all users to @users" do
        users = create_list(:user, 3)
        get :index
        expect(assigns(:users)).to match_array(users)
      end
    end

    context "when user is not an admin" do
      let(:user) { create(:user) }
      before { allow(controller).to receive(:current_user).and_return(user) }

      it "sets a flash notice" do
        get :index
        expect(flash[:notice]).to eq("You aren't authorized to view the users index page")
      end
    end
  end
end

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe "GET #show" do
    context "when user is authorized to view the page" do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        get :show, params: { id: user.id }
      end

      it "renders the show template" do
        expect(response).to render_template(:show)
      end

      it "returns a success response" do
        expect(response).to be_successful
      end
    end

    context "when user is not authorized to view the page" do
      before do
        allow(controller).to receive(:current_user).and_return(nil)
        get :show, params: { id: user.id }
      end

      it "sets a flash message" do
        expect(flash[:notice]).to eq("You aren't authorized to view this user's page")
      end
    end
  end
end

RSpec.describe UsersController, type: :controller do
  describe "GET #edit" do
    let!(:user) { create(:user) }

    context "when the user is authorized to edit" do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        get :edit, params: { id: user.id }
      end

      it "returns a successful response" do
        expect(response).to be_successful
      end

      it "renders the edit template" do
        expect(response).to render_template(:edit)
      end
    end

    context "when the user is not authorized to edit" do
      before do
        allow(controller).to receive(:current_user).and_return(create(:user))
        get :edit, params: { id: user.id }
      end

      it "sets a flash notice" do
        expect(flash[:notice]).to eq("You aren't authorized to edit other users")
      end
    end
  end
end

describe "POST #create" do
  context "with valid attributes" do
    it "creates a new user" do
      expect {
        post :create, params: { user: { username: "abcd", password: "password", name: "abcd", email: "abcd@example.com" } }
      }.to change(User, :count).by(1)
    end

    it "redirects to the new user's show page" do
      post :create, params: { user: { username: "abcd", password: "password", name: "abcd", email: "abcd@example.com" } }
      expect(response).to redirect_to(user_url(User.last))
    end
  end

  context "with invalid attributes" do
    it "does not create a new user" do
      expect {
        post :create, params: { user: { username: "", password: "password", name: "abcd", email: "abcd@example.com" } }
      }.to_not change(User, :count)
    end
  end
end

RSpec.describe UsersController, type: :controller do
  describe 'PUT #update' do
    let(:user) { create(:user) }
    let(:valid_attributes) { { name: 'new name' } }
    let(:invalid_attributes) { { name: '' } }

    context 'when user is logged in' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      context 'with valid parameters' do
        it 'updates the user' do
          put :update, params: { id: user.id, user: valid_attributes }
          user.reload
          expect(user.name).to eq('new name')
        end

        it 'redirects to the updated user' do
          put :update, params: { id: user.id, user: valid_attributes }
          expect(response).to redirect_to(user)
        end
      end

      context 'with invalid parameters' do
        it 'does not update the user' do
          put :update, params: { id: user.id, user: invalid_attributes }
          user.reload
          expect(user.name).not_to eq('')
        end

        it 're-renders the edit template' do
          put :update, params: { id: user.id, user: invalid_attributes }
          expect(response).to render_template(:edit)
        end
      end
    end
  end
end
RSpec.describe UsersController, type: :controller do
  describe 'DELETE #destroy' do
    let!(:user) { create(:user) }

    context 'when user is authorized' do
      before do
        allow(controller).to receive(:authorized).and_return(true)
        session[:user_id] = user.id
      end

      it 'deletes the user' do
        expect {
          delete :destroy, params: { id: user.id }
        }.to change(User, :count).by(-1)
      end

      it 'redirects to root path' do
        delete :destroy, params: { id: user.id }
        expect(response).to redirect_to(root_path)
      end

      it 'sets a flash notice' do
        delete :destroy, params: { id: user.id }
        expect(flash[:notice]).to eq('User was successfully destroyed.')
      end
    end
  end
end
