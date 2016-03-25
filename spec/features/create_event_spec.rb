require 'rails_helper'

feature "AddNewEvents", :type => :feature do
  it "should require the user log in before adding an event" do
    password = "123456789"
    u = create( :user, password: password, password_confirmation: password )

    visit new_event_path

    within "#new_user" do
      fill_in "user_email", with: u.email
      fill_in "user_password", with: password
    end

    click_button "Sign in"

    within "#new_event" do
      fill_in "event_name", with: "Rails Event"
      fill_in "event_extended_html_description", with: "Best Rails event"
      fill_in "event_hero_image_url", with: "Some random image"
      select_date_and_time(DateTime.now, from:'event_starts_at')
      select_date_and_time(DateTime.now, from:'event_ends_at')


      find("#event_venue_id").click

      find("#event_category_id").click

      click_button "Create Event"
    end

    expect(page).to have_content('Event has been created succesfully')

    # it "should create an event" do

    #   expect { click_button "Create Event" }.to change(Event, :event).by(1)

      # expect( Event.first.name).to eq( "Rails Event")
    # end
  end
end
