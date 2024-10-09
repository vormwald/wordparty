class DropUsers < ActiveRecord::Migration[8.0]
  def up
    drop_table :users
  end

  def down
    raise ActiveRecord::IrreversibleMigration.new("Cannot rollback past this point. The 'users' table structure is not available.")
  end
end
