require 'rails_helper'

RSpec.describe Film, type: :model do
  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:episode_id) }
    it { should validate_presence_of(:opening_crawl) }
    it { should validate_presence_of(:director) }
    it { should validate_presence_of(:producer) }
    it { should validate_presence_of(:release_date) }
  end

  context 'associations' do
    it { should have_many(:characters).through(:casts) }
    it { should have_many(:planets).through(:scenarios) }

    it { should have_many(:casts) }
    it { should have_many(:scenarios) }
  end
end
