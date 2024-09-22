class CreatePlayers < ActiveRecord::Migration[7.2]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :avatar_url
      t.string :session_token
      t.references :user, foreign_key: true, null: true
      t.references :game, foreign_key: true, null: true

      t.timestamps
    end
    add_index :players, :session_token, unique: true
  end
end
