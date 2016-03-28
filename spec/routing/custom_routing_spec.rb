require "rails_helper"

RSpec.describe "custom routing", type: :routing do
  it 'route to the page show created events by a particular user' do
    expect(:get => '/yourevents').to route_to("events#user_events")
  end

  it 'do not route to destroy  event action' do
    expect(:delete => "/events/1").not_to be_routable
  end
end
