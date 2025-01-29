class RemoveNameAndNameReadingFromUsers < ActiveRecord::Migration[7.1]
  def change
    if column_exists?(:users, :name_reading)
    remove_column :users, :name_reading, :string
  end
end
end