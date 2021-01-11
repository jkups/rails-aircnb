class AddTrxnCodeToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :trxn_code, :string
  end
end
