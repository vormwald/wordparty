class CreateRounds < ActiveRecord::Migration[7.2]
  def change
    create_table :rounds do |t|
      t.references :game, null: false, foreign_key: true
      t.datetime :started_at
      t.datetime :ended_at
      t.string :word, null: false

      t.timestamps
    end
  end
end
