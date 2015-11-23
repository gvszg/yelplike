require 'spec_helper'

describe ReviewsController do
  describe "POST create" do
    let(:biz) { Fabricate(:business) }

    context "with authenticated users" do
      let(:current_user) { Fabricate(:user) }
      before { session[:user_id] = current_user.id }

      context "with valid inputs" do
        before do
          post :create, review: Fabricate.attributes_for(:review), business_id: biz.id
        end

        it "redirects to the business show page" do
          expect(response).to redirect_to biz
        end

        it "creates a review" do
          expect(Review.count).to eq(1)
        end

        it "creates a review associated with the business" do
          expect(Review.first.business).to eq(biz)
        end

        it "creates a review associated with the signed in user" do
          expect(Review.first.creator).to eq(current_user)
        end
      end

      context "with invalid inputs" do
        before do
          post :create, review: { rating: 3 }, business_id: biz.id
        end

        it "does not create the review" do
          expect(Review.count).to eq(0)
        end

        it "renders the businesses/show template" do
          expect(response).to render_template 'businesses/show'
        end

        it "sets @business" do
          expect(assigns(:business)).to eq(biz)
        end

        it "sets @reviews" do
          review = Fabricate(:review, business: biz)
          post :create, review: { rating: 4 }, business_id: biz.id
          expect(assigns(:reviews)).to match_array([review])
        end  
      end
    end

    context "with unauthenticated users" do
      it "redirects to the sign in page" do
        post :create, review: Fabricate.attributes_for(:review), business_id: biz.id
        expect(response).to redirect_to sign_in_path
      end
    end
  end
end