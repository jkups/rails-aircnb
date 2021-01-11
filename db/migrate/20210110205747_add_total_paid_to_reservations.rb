class AddTotalPaidToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :total_paid, :float, :default => 0.00
  end
end
