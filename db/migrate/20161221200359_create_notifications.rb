class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
    	t.references :user, index: true
    	t.references :notified_by, index: true
    	t.references :quote, index: true
    	t.integer :identifier
    	t.string :notice_type
    	t.boolean :read, default: false

      t.timestamps
    end
    add_foreign_key :notifications, :users
    add_foreign_key :notifications, :users, column: :notified_by_id
  	add_foreign_key :notifications, :quotes
  end
end
