class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, limit: 255, null: false
      t.string :url, limit: 500, null: false
      t.string :image, limit: 500, null: false
      t.timestamps null: false
    end
  end
end
