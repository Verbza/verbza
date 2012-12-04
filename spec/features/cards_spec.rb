require 'spec_helper'

describe "Cards" do


  describe "new card" do
    context "with correct submission" do
      # before(:each) do
      #    @user = create(:user)
      #    sign_in(@user)
      #  end
      it "saves a card with a native and foreign word" do
        user = create(:user)
        sign_in(user)

        visit root_path

        expect{
          fill_in "Foreign Word", with: "auto"
          fill_in "Native Word", with: "car"
          click_button "Create Card"
        }.to change(Card, :count).by(1)

        card = user.decks.first.cards.last

        current_path.should eq deck_card_path(user.decks.first, card)

        page.should have_content("auto")
        page.should have_content("car")
      end

      it "saves a card with a native word and without a foreign word" do
        user = create(:user)
        sign_in(user)

        puts user.decks.first

        visit root_path

        expect{
          fill_in "Native Word", with: "car"
          click_button "Create Card"
        }.to change(Card, :count).by(1)

        card = user.decks.first.cards.last

        current_path.should eq deck_card_path(user.decks.first, card)

        page.should have_content("car")
      end
      #
      #       it "saves a card without a native word and with a foreign word" do
      #         visit root_path
      #
      #         expect{
      #           fill_in "Foreign Word", with: "auto"
      #           click_button "Create Card"
      #         }.to change(Card, :count).by(1)
      #
      #         card = @user.decks.first.cards.last
      #
      #         current_path.should eq deck_card_path(@user.decks.first, card)
      #
      #         page.should have_content("auto")
      #       end

      it "saves the picture when submitted"

      it "saves the card to the user's all cards deck"

      it "saves the card to any decks the user indicates"

      it "saves the correct data"

    end

    context "with incorrect submission" do
      it "prohibits cards without words"
    end
  end
end