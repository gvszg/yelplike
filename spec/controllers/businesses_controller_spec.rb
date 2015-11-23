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
end