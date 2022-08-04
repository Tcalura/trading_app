class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :device, null: false, foreign_key: true
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
