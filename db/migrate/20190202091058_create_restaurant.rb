class CreateRestaurant < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :token, null: false, default: ''

      t.timestamps
    end

    add_index :restaurants, :email, unique: true
  end
end
