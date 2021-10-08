class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :post_num, null: false
      t.integer :prefecture_id, null: false
      t.string :municipalities, null: false
      t.string :street_number, null: false
      t.string :building_name
      t.string :phone_num, null: false
      t.references :purchase_history, foreign_key: true, null: false
      t.timestamps
    end
  end
end
