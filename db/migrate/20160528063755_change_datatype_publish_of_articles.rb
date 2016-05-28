class ChangeDatatypePublishOfArticles < ActiveRecord::Migration
  def change
    change_column :articles, :publish, :datetime
  end
end
