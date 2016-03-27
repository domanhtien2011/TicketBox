require 'rails_helper'

describe EventsController do
  describe "guest user" do
     describe "GET new" do
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

    describe "PUT update" do
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

    describe "POST create" do
      it "redirects to create ticket type " do
        post :create, event: create(:event, user: user)
      end
    end
  end





  # describe "GET show" do
  #   let(:event) { create(:event,   user: create(:user)) }
  #   it "renders :show template" do
  #     get :show, id: event.id
  #     expect(response).to render_template(:show)
  #   end

  #   it "assigns requested event to @event"
  # end
end
