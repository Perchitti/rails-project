class UsersController < ApplicationController

def index
end

def show
  @user = User.find(session[:user_id])
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
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
    @user.update(user_params)
      if @user.save
        redirect_to @user
      else
        render :edit
    end
end

def destroy
  @user = User.find(params[:id])
  @user.destroy
  flash[:notice] = "User Deleted"
  redirect_to users_path
end

private

def user_params
  params.require(:user).permit(:name, :password, :password_digest)
end
end
