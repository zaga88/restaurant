class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.integer :guest_count, null: false, default: 1
      t.references :restaurant, index: true
      t.references :user, index: true
      t.timestamps
    end
  end
end
