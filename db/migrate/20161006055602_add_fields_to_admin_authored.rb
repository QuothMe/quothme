class AddFieldsToAdminAuthored < ActiveRecord::Migration[5.0]
  def change
  add_column :quotes, :author_first_name, :string
  add_column :quotes, :author_last_name, :string
  add_column :quotes, :author_email, :string
  add_column :quotes, :author_username, :string
  end
end
