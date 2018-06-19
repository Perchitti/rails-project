class ProjectsController < ApplicationController
  def index
      if params[:user_id]
        @user = User.find_by(id: params[:user_id])
        if @user.nil?
          redirect_to users_path, alert: "User not found"
        else
          @projects = @user.projects
        end
      else
        @projects = Project.all
      end
    end

def new
end

def show
end

end
