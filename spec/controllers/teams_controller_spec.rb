require 'spec_helper'

describe TeamsController do
  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
