class AddRowToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :table_id, :integer, null: false
    add_column :reservations, :shifts_id, :integer, null: false
  end

  add_index :reservations , [:table_id , :shifts_id]
end
