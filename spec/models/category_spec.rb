require 'rails_helper'

RSpec.describe Region, type: :model do
  describe 'validations' do
    it { should validate_inclusion_of(:name).in?(["Entertainment", "Learning", "Everything Else", "Dating"]) }

    it { should validate_uniqueness_of(:name) }
  end
end
