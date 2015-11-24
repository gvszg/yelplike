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

      it "redirect to sign in page" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(response).to redirect_to sign_in_path
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

  describe "GET show" do
    context "with authenticated users" do
      let(:joe) { Fabricate(:user) }
      before do 
        session[:user_id] = joe.id
        get :show, id: joe.id
      end

      it "sets @user" do        
        expect(assigns(:user)).to eq(joe)
      end

      it "sets @review" do
        review1 = Fabricate(:review, creator: joe)
        review2 = Fabricate(:review, creator: joe)
        expect(assigns(:reviews)).to match_array([review1, review2])
      end
    end

    context "with unauthenticated users" do
      let(:joe) { Fabricate(:user) }

      it "redirects to the sign in page" do        
        get :show, id: joe.id
        expect(response).to redirect_to sign_in_path
      end
    end
  end
end
















