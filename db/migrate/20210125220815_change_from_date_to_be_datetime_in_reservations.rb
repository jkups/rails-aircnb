class ChangeFromDateToBeDatetimeInReservations < ActiveRecord::Migration[5.2]
  def change
     change_column :reservations, :from_date, :datetime
  end
end
