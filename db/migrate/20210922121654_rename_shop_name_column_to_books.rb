class RenameShopNameColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :shop_name, :body
  end
end
