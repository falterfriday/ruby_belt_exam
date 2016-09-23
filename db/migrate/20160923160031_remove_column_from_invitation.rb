class RemoveColumnFromInvitation < ActiveRecord::Migration[5.0]
  def change
    remove_column :invitations, :invite, :integer
  end
end
