class AddAboutInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :about_info, :text
  end
end
