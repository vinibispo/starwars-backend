require 'rails_helper'

RSpec.describe "Films", type: :request do
  describe "GET index" do
    it "returns http success" do
      get films_path
      expect(response).to have_http_status(:success)
    end

    it "returns the correct number of films" do
      FactoryBot.create_list(:film, 10)
      get films_path

      expect(response.headers["Total-Count"]).to eq("10")
    end

    it "returns the correct number of films when searching" do
      FactoryBot.create_list(:film, 10)
      FactoryBot.create(:film, title: "Star Wars")
      get films_path, params: { q: "Star Wars" }

      expect(response.headers["Total-Count"]).to eq("1")
    end
  end
end
