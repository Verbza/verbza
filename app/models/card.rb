class Card < ActiveRecord::Base
  after_create :add_to_all_cards
  belongs_to :user

  has_many :card_decks
  has_many :decks, :through => :card_decks

  attr_accessible :decks, :foreign_word, :native_word, :user_id

  validates :native_word,
    :presence => true

  validates :foreign_word,
    :presence => true

  private

  def add_to_all_cards
    current_user.decks.first.cards.create(:native_word => self.native_word,
    :foreign_word => self.foreign_word, :user_id => current_user.id)
  end
end
