class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.datetime :ended_at
      t.datetime :started_at
      t.integer :round_time_limit, null: false
      t.string :invite_code, null: false
      t.integer :num_rounds, null: false
      t.integer :num_letters, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end

    add_index :games, :invite_code, unique: true
  end
end
