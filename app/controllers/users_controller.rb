class UsersController < ApplicationController
  before_action :authenticate

def index
  @users = User.all
end

def new
  @user = User.new
end

def create
  @user = User.new(user_params)

  if @user.save
    session[:user_id] = @user.id
    redirect_to '/show'
  else
    flash[:notice] = "ERROR: Please Try Again"
    redirect_to '/signup'
  end
end

def show
  @user = current_user
end

def edit
  @user = current_user
end


private

def user_params
  params.require(:user).permit(:name, :password, :password_confirmation)
end
end
