class AddTrxnStatusToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :trxn_status, :string, :default => 'pending'
  end
end
