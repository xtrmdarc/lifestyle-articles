class ChangeVoteCountToArticles < ActiveRecord::Migration[5.2]
  def change
    change_column_default :articles, :vote_count, 0
  end
end
