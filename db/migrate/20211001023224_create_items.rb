class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, default: ""
      t.text :item_text, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :shipping_charge_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :send_day_id, null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
