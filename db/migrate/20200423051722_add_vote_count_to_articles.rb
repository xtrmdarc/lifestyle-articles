class AddVoteCountToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :vote_count, :integer
  end
end
