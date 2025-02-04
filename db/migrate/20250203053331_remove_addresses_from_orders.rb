class RemoveAddressesFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :addresses, :string
  end
end
