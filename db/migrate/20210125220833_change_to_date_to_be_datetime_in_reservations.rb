class ChangeToDateToBeDatetimeInReservations < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :to_date, :datetime
  end
end
