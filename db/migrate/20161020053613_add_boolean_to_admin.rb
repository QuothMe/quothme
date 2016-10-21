class AddBooleanToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :admin, :boolean, default: true 
  end
end
