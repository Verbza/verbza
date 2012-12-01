class HomeController < ApplicationController

  def index
    @card = Card.new
    @decks = current_user.decks
    #@decks = Deck.all
  end

end