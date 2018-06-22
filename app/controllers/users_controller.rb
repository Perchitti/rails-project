class UsersController < ApplicationController

def index
  @users = User.all
end

def show
  @user = current_user
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
    redirect_to '/signup'
  end
end

def edit
  @user = current_user
end


def destroy
  @user = current_user
  @user.destroy
  flash[:notice] = "User Deleted"
  redirect_to '/signup'
end

private

def user_params
  params.require(:user).permit(:name, :password, :password_confirmation)
end
end
