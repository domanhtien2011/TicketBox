require 'rails_helper'
RSpec.describe "events/show", type: :view do
  before do
    user = create(:user)
    @event = create(:event, name: 'Rails conference', starts_at: Faker::Time.backward(14, :day), user: user)
  end

  describe 'user only can buy ticket for valid conference' do
    include EventsHelper

    it 'test book ticket now button' do
      if check_event_validation?(@event)
        expect(rendered).to have_tag('h3', text: :'Sorry, this event expired.')
      end
    end
  end

  describe 'Only author can edit event' do
    # let(:user) {create(:user)}
    it 'test edit button' do
      if :user == @event.user_id
       expect(rendered).to have_tag('a', text: :'Edit Event')
      end
    end
  end
end
