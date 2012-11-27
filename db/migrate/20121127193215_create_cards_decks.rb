class CreateCardsDecks < ActiveRecord::Migration
  def change
    create_table :cards_decks do |t|
      t.integer :deck_id
      t.integer :card_id

      t.timestamps
    end
  end
end
