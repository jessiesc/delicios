class AddTopicIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :topic_id, :integer
  end
end
