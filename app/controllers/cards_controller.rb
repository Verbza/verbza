class CardsController < ApplicationController
  def index
    @deck = Deck.find(params[:deck_id])
    @cards = @deck.cards
  end

  def new
    # @card = current_user.cards.new
    # @deck = current_user.decks.first
  end

  def create
    @deck = current_user.decks.find(params[:deck_id])
    @card = @deck.cards.build(params[:card])
    @card.user_id = current_user.id

    if @card.save
      @card.card_decks.create(:deck_id => @deck.id)
      redirect_to deck_card_path(@deck, @card)
    else
      render 'new'
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])

    if @card.update_attributes(params[:card])
      redirect_to @card
    else
      render 'edit'
    end
  end

  def destroy
    @deck = Deck.find(params[:deck_id])
    @card = Card.find(params[:id])
    @card.destroy

    redirect_to deck_cards_path(@deck)
  end
end
