require 'spec_helper'

describe DecksController do
  describe 'GET #index' do
    it "populates an array of decks" do
      deck = create(:deck)
      get :index
      assigns(:decks).should eq [deck]
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe 'GET #show' do
    before(:each) do
      @deck = create(:deck)
      get :show, id: @deck
    end

    it "assigns the requested deck to @deck" do
      assigns(:deck).should eq @deck
    end

    it "renders the :show template" do
      response.should render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new Deck to @deck" do
      get :new
      assigns(:deck).should be_a_new(Deck)
    end

    it "renders the :new template" do
      get :new
      response.should render_template :new
    end
  end

  describe 'GET #edit' do
    before(:each) do
      @deck = create(:deck)
      get :edit, id: @deck
    end
    it "assigns the requested deck to @deck" do
      assigns(:deck).should eq @deck
    end

    it "renders the :edit template" do
      response.should render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new deck in the database" do
        expect{
          post :create, deck: attributes_for(:deck)
        }.to change(Deck, :count).by(1)
      end

      it "redirects to the home page" do
        post :create, deck: attributes_for(:deck)
        response.should redirect_to root_url
      end
    end

    context "with invalid attributes" do
      it "does not save the new message in the database" do
        expect{
          post :create, deck: attributes_for(:deck, name: nil)
        }.to_not change(Deck, :count)
      end

      it "re-renders the :new template" do
        post :create, deck: attributes_for(:deck, name: nil)
        response.should render_template :new
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      @deck = create(:deck, name: "Chinese Vocab")
    end

    it "locates the requested @deck" do
      put :update, id: @deck, deck: attributes_for(:deck)
      assigns(:deck).should eq(@deck)
    end

    context "with valid attributes" do
      it "changes @deck's attributes" do
        put :update, id: @deck, deck: attributes_for(:deck, name: "Arabic Vocab")
        @deck.reload
        @deck.name.should eq("Arabic Vocab")
      end

      it "redirects to the updated deck" do
        put :update, id: @deck, deck: attributes_for(:deck)
        response.should redirect_to @deck
      end
    end

    context "with invalid attributes" do
      it "does not change @deck's attributes" do
        put :update, id: @deck, deck: attributes_for(:deck, name: nil)
        @deck.reload
        @deck.name.should_not be_nil
      end

      it "re-renders the edit method" do
        put :update, id: @deck, deck: attributes_for(:deck, name: nil)
        response.should render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @deck = create(:deck)
    end

    it "deletes the message" do
      expect{
        delete :destroy, id: @deck
      }.to change(Deck, :count).by(-1)
    end

    it "redirects to decks#index" do
      delete :destroy, id: @deck
      response.should redirect_to decks_url
    end
  end
end
