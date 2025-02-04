class AddBuildingToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :building, :string
  end
end
