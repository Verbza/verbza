class Deck < ActiveRecord::Base
  belongs_to :user

  has_many :card_decks
  has_many :cards, :through => :card_decks

  attr_accessible :name, :user, :cards

  validates :name,
    presence: true

  def num_cards_in_deck
    self.cards.count
  end

end
