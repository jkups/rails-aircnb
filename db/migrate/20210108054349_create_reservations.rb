class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :booking_code
      t.date :from_date
      t.date :to_date
      t.string :property_id

      t.timestamps
    end
  end
end
