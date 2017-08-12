require 'rails_helper'

RSpec.describe CartsController, type: :controller do

  let(:user) {FactoryGirl.create :user}

  def signin
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  describe "GET #show" do
    before(:each) {signin}

    it "returns http success" do
      get :show
      expect(response).to render_template(:show)
    end
  end

end
