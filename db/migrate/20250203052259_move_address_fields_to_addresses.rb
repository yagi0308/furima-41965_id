class MoveAddressFieldsToAddresses < ActiveRecord::Migration[7.1]
  def change
   # ordersテーブルから不要なカラムを削除（存在するものだけを削除）
   remove_column :orders, :postal_code, :string if column_exists?(:orders, :postal_code)
   remove_column :orders, :prefecture_id, :integer if column_exists?(:orders, :prefecture_id)
   remove_column :orders, :city, :string if column_exists?(:orders, :city)
   remove_column :orders, :addresses, :string if column_exists?(:orders, :addreses)
   remove_column :orders, :phone_number, :string if column_exists?(:orders, :phone_number)
   remove_column :orders, :building, :string if column_exists?(:orders, :building)

   # addressesテーブルにカラムを追加
   add_column :addresses, :postal_code, :string unless column_exists?(:addresses, :postal_code)
   add_column :addresses, :prefecture_id, :integer unless column_exists?(:addresses, :prefecture_id)
   add_column :addresses, :city, :string unless column_exists?(:addresses, :city)
   add_column :addresses, :addresses, :string unless column_exists?(:addresses, :addresses)
   add_column :addresses, :phone_number, :string unless column_exists?(:addresses, :phone_number)
   add_column :addresses, :building, :string unless column_exists?(:addresses, :building)
  end
end
