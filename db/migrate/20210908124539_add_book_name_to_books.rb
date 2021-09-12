class AddBookNameToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :book_name, :string
  end
end
