require 'spec_helper'

describe DecksController do
  describe 'GET #index' do
    it "populates an array of decks" do
      deck = create(:deck)
      get :index
      assigns(:decks).should eq [deck]
    end

    it "renders the :index view"
  end
end
