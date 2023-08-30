class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.string :introduction, null: false
      t.integer :price, null: false
      t.string :address, null: false
      t.string :image

      t.timestamps
    end
  end
end
