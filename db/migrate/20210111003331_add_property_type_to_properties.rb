class AddPropertyTypeToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :property_type, :string
  end
end
