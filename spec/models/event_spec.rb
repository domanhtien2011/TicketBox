require 'rails_helper'

RSpec.describe Event, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:extended_html_description) }

    it { should validate_presence_of(:hero_image_url) }

    it { should validate_uniqueness_of(:name).scoped_to(:venue_id, :starts_at) }

    it { should validate_presence_of(:user) }

    it { should have_many(:ticket_types) }

    it { should belong_to(:user) }

    it { should belong_to(:venue) }
    it { should belong_to(:category) }
  end
end
