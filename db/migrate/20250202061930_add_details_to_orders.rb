class AddDetailsToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :postal_code, :string, null: false
    add_column :orders, :prefecture_id, :integer, null: false
    add_column :orders, :city, :string, null: false
    add_column :orders, :addresses, :string, null: false
    add_column :orders, :phone_number, :string, null: false
  end
end
