class Card < ActiveRecord::Base
  belongs_to :user

  has_many :card_decks
  has_many :decks, :through => :card_decks

  attr_accessible :decks, :foreign_word, :native_word, :user_id

  validates :native_word,
    :presence => true

  validates :foreign_word,
    :presence => true


end
