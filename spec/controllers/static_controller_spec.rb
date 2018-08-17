require 'rails_helper'

RSpec.describe StaticController, type: :controller do

  describe "GET #index_townhalls" do
    it "returns http success" do
      get :index_townhalls
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index_journalists" do
    it "returns http success" do
      get :index_journalists
      expect(response).to have_http_status(:success)
    end
  end

end
