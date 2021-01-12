class AddGuestsCountToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :guests_count, :integer
  end
end
