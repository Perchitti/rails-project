class SessionsController < ApplicationController


  def create
  @user = User.find_or_create_from_auth_hash(request.env["omniauth.auth"])
    session[:user_id] = @user.id
      redirect_to '/show'
   end

def login
    @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
       session[:user_id] = @user.id
       redirect_to '/show'
     else
       flash[:notice] = "ERROR: Incorrect Name or Password OR Sign Up"
       redirect_to '/'
       end
end


def destroy
  session.delete :user_id
  redirect_to '/'

end

end
