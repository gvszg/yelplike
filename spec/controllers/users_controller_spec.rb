require 'spec_helper'

describe UsersController do
  describe "GET new" do
    it "sets @user" do
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe "POST create" do
    context "with valid inputs" do
      it "creates the user" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(User.count).to eq(1)
      end

      it "redirect to home page" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(response).to redirect_to home_path
      end
    end

    context "with invalid inputs" do
      it "does not create the user" do
        post :create, user: {password: 'password', full_name: 'Clair Fortune'}
        expect(User.count).to eq(0)
      end

      it "renders the new template" do
        post :create, user: {password: 'password', full_name: 'Clair Fortune'}
        expect(response).to render_template :new
      end

      it "sets @user" do
        post :create, user: {password: 'password', full_name: 'Clair Fortune'}
        expect(assigns(:user)).to be_instance_of(User)
      end
    end
  end
end