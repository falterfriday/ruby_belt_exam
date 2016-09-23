class AddColumnToFriendship < ActiveRecord::Migration[5.0]
  def change
    add_column :friendships, :friend_id, :integer
  end
end
