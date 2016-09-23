class Invitation < ApplicationRecord
  belongs_to :user, :foreign_key => "user_id", :class_name => "User"
  belongs_to :invite, :foreign_key => "invite_id", :class_name => "User"
end
