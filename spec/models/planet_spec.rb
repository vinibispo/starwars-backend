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

  context 'associations' do
    it { should have_many(:residents).class_name('Person').with_foreign_key('homeworld') }
    it { should have_many(:film_planets).class_name('Film::Planet') }
    it { should have_many(:films).through(:film_planets) }
  end
end
