class Card < ActiveRecord::Base
  belongs_to :user
  has_many :cards_decks
  has_many :decks, :through => :cards_decks

  attr_accessible :cards_decks_id, :foreign_word, :native_word, :user_id

  validates :native_word,
    :presence => true
    
  validates :foreign_word,
    :presence => true
end
