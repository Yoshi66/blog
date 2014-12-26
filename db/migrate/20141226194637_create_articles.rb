class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.string :content
      t.integer :post_id

      t.timestamps
    end
  end
end
