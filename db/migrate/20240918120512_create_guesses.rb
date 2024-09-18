class CreateGuesses < ActiveRecord::Migration[7.2]
  def change
    create_table :guesses do |t|
      t.references :board, null: false, foreign_key: true
      t.string :word, null: false
      t.string :correct_letters, null: false
      t.string :correct_positions, null: false

      t.timestamps
    end
  end
end
