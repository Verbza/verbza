class DecksController < ApplicationController
  before_filter :validate_user
  before_filter :find_deck, :only => [:show, :edit, :update, :destroy]

  def index
    @decks = current_user.decks
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def new
    @deck = current_user.decks.new # pass user's id
  end

  def edit
  end

  def create
    @deck = current_user.decks.build(params[:deck])

    if @deck.save
      redirect_to decks_path
    else
      render 'new'
    end
  end

  def update
    if @deck.update_attributes(params[:deck])
      redirect_to @deck
    else
      render 'edit'
    end
  end

  def destroy
    @deck.destroy

    redirect_to decks_url
  end

  private

  def find_deck
    @deck = current_user.decks.find(params[:id])
  end

  def validate_user
    redirect_to root_url unless current_user
  end
end
