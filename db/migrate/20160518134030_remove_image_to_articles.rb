class RemoveImageToArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :image, :string
  end
end
