class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :shop_name
      t.string :image_id
      t.text :caption
      t.integer :user_id
      t.string :title
      t.timestamps
    end
  end
end
