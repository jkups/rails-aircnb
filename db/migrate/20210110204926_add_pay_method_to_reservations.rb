class AddPayMethodToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :pay_method, :string
  end
end
