require 'rails_helper'

RSpec.describe Venue, type: :model do
  describe 'validations' do
    it { should belong_to(:region) }
    it { should validate_uniqueness_of(:name) }
  end
end
