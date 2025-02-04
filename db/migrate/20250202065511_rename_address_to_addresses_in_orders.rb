class RenameAddressToAddressesInOrders < ActiveRecord::Migration[7.1]
  def change
    rename_column :orders, :addresses, :addresses
  end
end
