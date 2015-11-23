require 'spec_helper'

describe BusinessesController do
  describe "GET show" do
    it "sets @business for authenticated users" do
      joe = Fabricate(:user)
      session[:user_id] = joe.id
      biz = Fabricate(:business)
      get :show, id: biz.id
      expect(assigns(:business)).to eq(biz)
    end

    it "redirects to sign in page for unauthenticated users" do
      biz = Fabricate(:business)
      get :show, id: biz.id
      expect(response).to redirect_to sign_in_path
    end
  end

  describe "GET new" do
    it "sets @business for the authenticated user" do
      joe = Fabricate(:user)
      session[:user_id] = joe.id
      get :new
      expect(assigns(:business)).to be_instance_of(Business)
    end

    it "redirects to sign in page for unauthenticated users" do
      get :new
      expect(response).to redirect_to sign_in_path
    end
  end

  describe "POST create" do
    let(:bar) { Fabricate(:category) }

    context "with authenticated users" do
      let(:current_user) { Fabricate(:user) }
      before { session[:user_id] = current_user.id }

      context "with valid inputs" do
        before do
          post :create, business: Fabricate.attributes_for(:business, category: bar)
        end

        it "creates a business" do
          expect(Business.count).to eq(1)
        end

        it "redirects to the business show page" do
          expect(response).to redirect_to Business.first
        end

        it "creates a business associated with the category" do
          expect(Business.first.category).to eq(bar)
        end

        it "creates a business associated with the signed in user" do
          expect(Business.first.creator).to eq(current_user)
        end
      end

      context "with invalid inputs" do
        before do
          post :create, business: { name: 'Bar', addres: 'Pike road', country: 'Taiwan' , category: bar}
        end

        it "renders the new template" do
          expect(response).to render_template :new
        end

        it "sets the flash error message" do
          expect(flash[:danger]).not_to be_blank
        end
      end
    end

    context "with unauthenticated users" do
      it "redirects to sign in page" do
        post :create, business: Fabricate.attributes_for(:business, category: bar)
        expect(response).to redirect_to sign_in_path 
      end
    end
  end
end