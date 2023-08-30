class AddUniqueConstraintOnUsernameAndEmail < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    add_index :users,
      %i[username],
      unique: true,
      algorithm: :concurrently

    add_index :users,
      %i[email],
      unique: true,
      algorithm: :concurrently
  end
end
