class AddSlugToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :quotes, :slug, :string
    add_index :quotes, :slug
  end
end
