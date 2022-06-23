require 'rails_helper'

RSpec.describe "Weapons", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/weapon/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/weapon/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/weapon/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
