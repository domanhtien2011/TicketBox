require 'rails_helper'

describe EventsController do
  describe "guest user" do
     describe "GET new" do
      before do
        user = create(:user)
        @event1 = create(:event, name: 'Rails conference', starts_at: Faker::Time.forward(7, :day), user: user)
        @event2 = create(:event, extended_html_description: 'rails developer', starts_at: Faker::Time.forward(14, :evening), user: user )
      end

       describe "GET index" do
        it 'show only coming events when search string is empty' do
          get :index, search: ''
          expect(response).to be_success
          expect(response).to have_http_status(200)
          expect(assigns(:events)).to eq([@event1, @event2])
          expect(response).to render_template(:index)
        end

        it "show only coming events when search string includes event's name or description" do
          get :index, search: 'rails'
          expect(response).to be_success
          expect(response).to have_http_status(200)
          expect(assigns(:events)).to eq([@event1, @event2])
          expect(response).to render_template('index')
        end
      end

      it "redirect to login page" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
     end

     describe 'create a new event' do
      it "redirects to login page" do
        post :create, event: create(:event, user: create(:user))
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'edit an event' do
      it 'redirects to login page' do
        get :edit, id: create(:event, user: create(:user))
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "update an event" do
      it "redirects to login page" do
        put :update, id: create(:event, user: create(:user))
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "authenticated user" do
    let(:user) { create(:user) }

    before do
      sign_in(user)
    end

    describe "GET new" do
      it "renders :new_template" do
        get :new
        expect(response).to render_template(:new)
      end

      it "assigns new Event to @event" do
        get :new
        expect(assigns(:event)).to be_a_new(Event)
      end
    end
  end
end
