class AddUsernameToAdmin < ActiveRecord::Migration[5.0]
  def change
  	add_column :admins, :username, :string
  end
end
