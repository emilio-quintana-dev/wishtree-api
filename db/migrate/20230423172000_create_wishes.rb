class CreateWishes < ActiveRecord::Migration[7.0]
  def change
    create_table :wishes do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.string :url
      t.bigint :user_id, null: false

      t.timestamps
    end
  end
end
