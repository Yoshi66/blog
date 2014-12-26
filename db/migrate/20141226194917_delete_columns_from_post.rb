class DeleteColumnsFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :title, :string
    remove_column :posts, :subtitle, :string
    remove_column :posts, :content, :string
  end
end
