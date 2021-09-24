class RenameMameColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :mame, :name
  end
end
