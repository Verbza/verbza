class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards_decks
  has_many :cards, :through => :cards_decks

  attr_accessible :name, :user_id
  
  validates :name,
    presence: true
end
