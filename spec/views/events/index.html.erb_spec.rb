require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before do
     user = create(:user)
      @event1 = create(:event, name: 'Rails conference', starts_at: Faker::Time.backward(7, :day), user: user)
      @event2 = create(:event, extended_html_description: 'rails developer', starts_at: Faker::Time.forward(14, :evening), user: user )
  end

  it 'render card partial for the coming events' do
    assign(:events, [@event1, @event2])
    render
    expect(view).to render_template(:partial => "_card", :count => 1)
  end
end
