require 'rails_helper'


describe EventsController do

  describe "guest user" do

  end

  describe "GET new" do
    it "renders :new_template" do
      login_with create( :user )
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns new Event to @event" do
      login_with create( :user )
      get :new
      expect(assigns(:event)).to be_a_new(Event)
    end
  end
end
