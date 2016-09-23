class AddColumnToInvitation < ActiveRecord::Migration[5.0]
  def change
    add_column :invitations, :invite_id, :integer
  end
end
