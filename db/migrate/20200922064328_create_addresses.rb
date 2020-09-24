class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id, null: false, FK:true
      t.string :zip_code, null: false
      t.integer :prefecture_id, null: false
      t.integer :city, null: false
      t.integer :house_number, null: false
      t.integer :building
      t.string :telephone, null: false
      t.timestamps
    end
  end
end
