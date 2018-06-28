class SessionsController < ApplicationController

  def create
  	 @user = User.find_or_create_from_auth_hash(env["omniauth.auth"])
      session[:user_id] = @user.id
  	   redirect_to '/show'
end


def destroy
session.delete :user_id
redirect_to '/'
end

end
