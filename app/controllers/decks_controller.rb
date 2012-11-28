class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def new
    @deck = Deck.new
  end

  def edit
    @deck = Deck.find(params[:id])
  end

  def create
    @deck = Deck.new(params[:deck])

    if @deck.save
      redirect_to decks_path
    else
      render 'new'
    end
  end

  def update
    @deck = Deck.find(params[:id])

    if @deck.update_attributes(params[:deck])
      redirect_to @deck
    else
      render 'edit'
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy

    redirect_to decks_url
  end
end
