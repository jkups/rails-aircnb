class AddTotalDueToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :total_due, :float, :default => 0.00
  end
end
