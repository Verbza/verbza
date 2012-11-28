class CardsController < ApplicationController
  def index
    @deck = Deck.find(params[:deck_id])
    @cards = @deck.cards
  end

  def new
    @card = current_user.cards.new
  end

  def create
    @deck = Deck.find(params[:deck_id])
    @card = @deck.cards.build(params[:card])

    if @card.save
      redirect_to @card
    else
      render 'new'
    end
  end

  def show

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
