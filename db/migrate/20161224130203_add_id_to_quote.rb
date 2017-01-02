class AddIdToQuote < ActiveRecord::Migration[5.0]
  def change
  	add_column :comments, :quote_id, :integer
  end
end
