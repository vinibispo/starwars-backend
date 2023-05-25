require 'rails_helper'

RSpec.describe 'Planets', type: :request do
  describe 'GET index' do
    it 'returns http success' do
      get planets_path
      expect(response).to have_http_status(:success)
    end

    it 'returns the correct number of planets' do
      FactoryBot.create_list(:planet, 10)
      get planets_path

      expect(response.headers['Total-Count']).to eq('10')
    end
  end
end
