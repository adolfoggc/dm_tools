require 'rails_helper'

RSpec.describe "Adventures", type: :request do
  describe "GET /combat" do
    it "returns http success" do
      get "/adventure/combat"
      expect(response).to have_http_status(:success)
    end
  end

end
