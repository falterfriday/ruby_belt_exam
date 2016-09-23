class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.references :user, foreign_key: true
      t.integer :invite_id

      t.timestamps
    end

    add_index(:invitations, [:user_id, :invite_user_id], :unique => true)

  end
end
