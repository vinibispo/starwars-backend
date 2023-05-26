require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:birth_year) }
    it { should validate_presence_of(:eye_color) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:hair_color) }
    it { should validate_presence_of(:height) }
    it { should validate_presence_of(:mass) }
    it { should validate_presence_of(:skin_color) }
    it { should validate_presence_of(:homeworld) }
  end

  context 'associations' do
    it { should have_many(:cast) }
    it { should have_many(:films).through(:cast) }

    it { should belong_to(:planet) }
  end
end
