class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :native_word
      t.string :foreign_word
      t.integer :user_id

      t.timestamps
    end
  end
end
