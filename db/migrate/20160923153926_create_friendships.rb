class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships, id: false do |t|
      t.integer :user_id, foreign_key: true
      t.integer :friend_id

      t.timestamps
    end

    add_index(:friendships, [:user_id, :friend_user_id], :unique => true)
  end
end
