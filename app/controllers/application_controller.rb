class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
        @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to '/main' unless current_user
  end

  def require_correct_user
        user = User.find(params[:id])
        redirect_to "/main" if current_user.id != user.id
  end
end
