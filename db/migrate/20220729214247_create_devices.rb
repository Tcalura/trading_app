class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :name, null: false
      t.decimal :price, null: false

      t.timestamps
    end
  end
end
