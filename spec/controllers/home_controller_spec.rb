require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #profile" do
    it 'returns 401 unless logged in' do
      get :profile
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
