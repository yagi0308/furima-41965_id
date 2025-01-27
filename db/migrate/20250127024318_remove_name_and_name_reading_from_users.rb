class RemoveNameAndNameReadingFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :name, :string
    remove_column :users, :name_reading, :string
  end
end
