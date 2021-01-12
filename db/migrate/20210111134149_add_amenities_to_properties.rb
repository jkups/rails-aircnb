class AddAmenitiesToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :amenities, :text
  end
end
