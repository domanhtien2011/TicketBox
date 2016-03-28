require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    user = create(:user)
    @event1 = create(:event, name: 'Rails conference', starts_at: Faker::Time.backward(7, :day), user: user)
    @event2 = create(:event, extended_html_description: 'rails developer', starts_at: Faker::Time.forward(14, :evening), user: user )
  end

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

  describe 'return coming events only' do
    it 'test the class event_check_validation method' do
      expect(Event.check_event_validation).to match_array([@event2])
    end
  end

  describe 'return events that have names or description in the search string' do
    it 'test the class search method' do
      string = 'vietnam'
      expect(Event.search(string)).to eq([])
    end
  end

  describe 'test whether an event has a ticket type or not' do
    it 'test the instance has_ticket_types? method' do
      expect(@event1.has_ticket_types?).to eq(false)
    end
  end
end
