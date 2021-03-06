require 'spec_helper'

describe SessionsController do
  describe "GET new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "with valid inputs" do
      it "redirects to home page" do
        user = Fabricate(:user)
        post :create, email: user.email, password: user.password
        expect(response).to redirect_to home_path
      end

      it "puts the signed user in the session" do
        user = Fabricate(:user)
        post :create, email: user.email, password: user.password
        expect(session[:user_id]).to eq(user.id)
      end
      
      it "sets the falsh warning message" do
        user = Fabricate(:user)
        post :create, email: user.email, password: user.password
        expect(flash[:success]).not_to be_blank
      end
    end

    context "with invalid inputs" do
      it "does not set user in the session" do
        user = Fabricate(:user)
        post :create, email: user.email, password: '1234'
        expect(session[:user_id]).not_to eq(user.id) 
      end

      it "redirects to sign in page" do
        user = Fabricate(:user)
        post :create, email: user.email, password: '1234'
        expect(response).to redirect_to sign_in_path
      end

      it "sets flash error message" do
        user = Fabricate(:user)
        post :create, email: user.email, password: '1234'
        expect(flash[:warning]).not_to be_blank
      end
    end
  end

  describe "GET destroy" do
    it "redirects to root page" do
      session[:user_id] = Fabricate(:user).id
      get :destroy
      expect(response).to redirect_to root_path
    end

    it "clear the session for the user" do
      session[:user_id] = Fabricate(:user).id
      get :destroy
      expect(session[:user_id]).to be_nil
    end

    it "sets the flash notice message" do
      session[:user_id] = Fabricate(:user).id
      get :destroy
      expect(flash[:info]).not_to be_blank   
    end
  end
end