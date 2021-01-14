class AddIdentityConfirmedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :identity_confirmed, :boolean
  end
end
