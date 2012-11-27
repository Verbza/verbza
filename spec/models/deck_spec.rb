require 'spec_helper'

describe Deck do
  it "has a valid factory" do
    create(:deck).should be_valid
  end

  it "is invalid without a name" do
    build(:deck, name: nil).should_not be_valid
  end

  it "saves a valid deck" do
    expect{ (create(:deck)).to change(Deck, :count).by(1) }
  end

  it "does not save an invalid deck" do
    expect{ (create(:deck, name: nil)).to_not change(Deck, :count) }
  end
end