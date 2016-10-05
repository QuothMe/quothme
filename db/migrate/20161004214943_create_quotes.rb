class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
        t.text :citation 
        t.string :image
        t.integer :quote_id
        t.integer :user_id
      t.timestamps
    end
  end
end
