class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :item_name,                   null: false
      t.string :item_info,                   null: false
      t.integer :item_price,                 null: false
      t.integer :item_category_id,           null: false
      t.integer :item_status_id,             null: false
      t.integer :item_shipping_fee_id,       null: false
      t.integer :item_prefecture_id,         null: false
      t.integer :item_scheduled_delivery_id, null: false
      t.references :user,                    null: false, foreign_key: true
      t.timestamps
    end
  end
end
