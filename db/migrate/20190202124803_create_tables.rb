class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.string :name, null: false
      t.integer :min_guest, null: false, default: 1
      t.integer :max_guest, null: false, default: 2
      t.references :restaurant, index: true
    end
  end
end
