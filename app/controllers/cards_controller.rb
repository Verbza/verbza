class CardsController < ApplicationController
  respond_to :json, :html

  def index
    @deck = Deck.find(params[:deck_id])

    respond_to do |format|
      format.html
      format.json { respond_with @deck.cards }
    end
    # respond_with @deck.cards
    #render :json => @deck.cards
  end

  def new
    @card = Card.new
    @decks = current_user.decks[1..-1]
  end

  def create
    @deck = current_user.decks.find(params[:deck_id])
    @card = @deck.cards.build(params[:card])
    @card.user = current_user

    if params[:deck_ids].nil?
      @card.decks << current_user.decks.first
    else
      params[:deck_ids] << @deck.id
      @card.decks << Deck.find(params[:deck_ids])
    end

    if @card.save
      redirect_to deck_card_path(@deck, @card)
    else
      render 'new'
    end

    @card.image_url = @card.image.url(:medium)
    @card.save
  end

  def show
    @card = Card.find(params[:id])
    @deck = Deck.find(params[:deck_id])
  end

  def edit
    @card = Card.find(params[:id])
    @decks = current_user.decks[1..-1]
  end

  def update
    @card = Card.find(params[:id])
    @deck = current_user.decks.find(params[:deck_id])

    unless params[:deck_ids].nil?
      @card.decks << Deck.find(params[:deck_ids])
    end

    if @card.update_attributes(params[:card])
      redirect_to deck_card_path(params[:deck_id], @card)
    else
      render 'edit'
    end
  end

  def destroy
    @deck = Deck.find(params[:deck_id])
    @card = @deck.cards.find(params[:id])
    @deck.cards.delete(@card)

    redirect_to deck_cards_path(@deck)
  end
end
