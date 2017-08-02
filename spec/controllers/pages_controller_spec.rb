require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  let(:user) {FactoryGirl.create :user}

  before(:each) {sign_in user}

  it('renders the page with the right params') do
    get :show, params: {page: 'index'}
    expect(response).to render_template("pages/index")
  end

end
