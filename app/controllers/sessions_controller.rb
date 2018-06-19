class SessionsController < ApplicationController

def create
  @user = User.find_by(name: params[:user][:name])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to '/show'
  else
    redirect_to '/login'
end
end

def destroy
session.delete :user_id
redirect_to '/'
end

end
