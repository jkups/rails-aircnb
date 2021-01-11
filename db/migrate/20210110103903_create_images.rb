class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :name
      t.text :description
      t.text :image_url
      t.integer :property_id

      t.timestamps
    end
  end
end
