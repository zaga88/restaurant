class AddIndexToReservations < ActiveRecord::Migration[5.2]
  def change
    add_index :reservations, [:table_id , :shift_id]
  end
end
