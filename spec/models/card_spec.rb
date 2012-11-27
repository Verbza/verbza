require 'spec_helper'

describe Card do
  it "has a valid factory" do
    create(:card).should be_valid
  end

  it "is invalid without a native word" do
    build(:card, native_word: nil).should_not be_valid
  end

  it "is invalid without a foreign_word" do
    build(:card, foreign_word: nil).should_not be_valid
  end

  it "saves a valid card" do
    expect{(create(:card)).to change(Card, :count).by(1)}
  end

  it "does not save an invalid card" do
    expect{ (create(:invalid_card)).to_not change(Card, :count) }
  end
end