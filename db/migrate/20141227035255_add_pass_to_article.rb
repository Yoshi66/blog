class AddPassToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :pass, :string
  end
end
