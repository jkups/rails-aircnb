class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :heading
      t.string :title
      t.text :address
      t.text :description
      t.integer :max_guests
      t.integer :bedrooms
      t.integer :bathrooms
      t.float :longitude
      t.float :latitude
      t.float :cleaning_fee
      t.float :service_fee
      t.text :street
      t.text :city
      t.text :state
      t.text :postcode

      t.timestamps
    end
  end
end
