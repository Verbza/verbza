class CardDeck < ActiveRecord::Base
  self.table_name = "cards_decks"
  attr_accessible :card_id
  belongs_to :deck
  belongs_to :card

end
