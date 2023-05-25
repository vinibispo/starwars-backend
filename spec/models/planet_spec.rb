require 'rails_helper'

RSpec.describe Planet, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:diameter) }
    it { should validate_presence_of(:rotation_period) }
    it { should validate_presence_of(:orbital_period) }
    it { should validate_presence_of(:gravity) }
    it { should validate_presence_of(:population) }
    it { should validate_presence_of(:climate) }
    it { should validate_presence_of(:terrain) }
    it { should validate_presence_of(:surface_water) }
  end
end
