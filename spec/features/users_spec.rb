require 'spec_helper'

describe "User management" do
  describe "sign up" do
    context "with correct information" do
      it "adds a new user and directs them to the root url" do
        user = build(:user)

        visit root_path
        expect{
          click_link "Sign up"
          fill_in "Email", with: user.email
          fill_in "Password", with: user.password
          fill_in "Password confirmation", with: user.password
          click_button "Sign up"
        }.to change(User, :count).by(1)

        current_path.should eq root_path

        page.should have_content "New Card"
      end
    end

    context "with incorrect information" do
      it "doesn't create a new user and displays an error" do
        user = build(:user, :password => "12345")

        visit root_path
        expect{
          click_link "Sign up"
          fill_in "Email", with: user.email
          fill_in "Password", with: user.password
          fill_in "Password confirmation", with: user.password
          click_button "Sign up"
        }.to_not change(User, :count).by(1)

        page.should have_content "Password is too short"
      end
    end
  end

  describe "user log in" do
    context "with correct information" do
      it "sends the user to the new card page" do
        user = create(:user)

        visit root_path
        sign_in(user)

        page.should have_content "New Card"
      end
    end

    context "with incorrect information" do
      it "displays an error" do
        user = build(:user, :password => 1)

        visit root_path
        sign_in(user)

        page.should have_content "Sign in"
      end
    end
  end

  describe "user log out" do
    it "logs out a user successfully" do
      user = create(:user)

      visit root_path
      sign_in(user)
      click_link "Sign out"

      page.should have_content "Sign in"

      visit root_path
      page.should_not have_content "New card"
    end
  end
end

