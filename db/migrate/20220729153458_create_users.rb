class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :user_name, null: false
      t.string :email, null: false
      t.date :birthdate, null: false
      t.boolean :vacation, null: false
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
