class CreatePurchaseUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_users do |t|
      t.string :postal_cord, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :addresses, null: false
      t.string :building
      t.string :phone_number, null: false
      t.references :purchase, foreign_key: true 
      t.timestamps
    end
  end
end