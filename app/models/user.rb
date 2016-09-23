class User < ApplicationRecord
  has_secure_password
  has_many :friendships, :foreign_key => "user_id", :class_name => "Friendship"
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship",  :foreign_key => "friend_id"

  has_many :invitations, :foreign_key => "user_id", :class_name => "Invitation"
  has_many :invites, :through => :invitations
  has_many :inverse_invitations, :class_name => "Invitation",  :foreign_key => "invite_id"


#------------------------EMAIL_REGEX------------------------
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    NAME_REGEX = /\A[^\W\d_]+\z/
#------------------------VALIDATIONS------------------------
    validates :name, :description,
        presence:true

    validates :name,
        format: {
          with:NAME_REGEX
        }
    validates :password, length: {minimum:8}

    validates :email,
        presence:true,
        uniqueness:{
            case_sensitive:false
            },
        format: {
            with:EMAIL_REGEX
            }

end
