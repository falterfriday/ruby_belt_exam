class UsersController < ApplicationController
    before_action :authorize, only: [:index, :profile, :invite, :add_friend]

    def index
        @users = User.where('id != ?', @current_user.id)
    end

    def main
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to '/professional_profile'
        else
            flash[:errors] = user.errors.full_messages
            redirect_to '/main'
        end
    end

    def login
        user = User.find_by_email(params[:loginUser][:email])
        if user && user.authenticate(params[:loginUser][:password])
            session[:user_id] = user.id
            redirect_to '/professional_profile'
        else
            flash[:errors] = ["Invalid Login Credentials"]
            redirect_to '/main'
        end
    end

    def profile
        @invitations = Invitation.where(invite_id:@current_user)
        @friendships = Friendship.where(friend_id: current_user.id)
    end

    def show
        @user = User.find(params[:id])
    end

    def logout
        session.clear
        redirect_to '/main'
    end

    def invite
        invitation = Invitation.new(user: @current_user, invite: User.find(params[:id]))
        if invitation.save
            redirect_to '/users'
        end
    end

    def delete_invitation
        invite = Invitation.find(params[:id])
        invite.destroy
        redirect_to '/professional_profile'
    end

    def add_friend
        Friendship.create(user: @current_user, friend_id: params[:id] )
        Invitation.destroy(params[:invite_id])
        redirect_to '/professional_profile'
    end

    private
    def user_params
        params.require(:user).permit(
                                :name,
                                :email,
                                :password,
                                :password_confirmation,
                                :description
                                )
    end
end
