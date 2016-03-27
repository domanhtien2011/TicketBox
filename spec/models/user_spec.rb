require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should have_many(:events) }
    it { should validate_uniqueness_of(:username) }
  end
end
