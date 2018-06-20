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


def show
  if params[:user_id]
  @user = User.find_by(id: params[:user_id])
  @project = @user.projects.find_by(id: params[:id])
  if @project.nil?
    redirect_to user_projects_path(@user), alert: "Project not found"
  end
else
  @project = Project.find(params[:id])
end
end

def new
  if params[:user_id] && !User.exists?(params[:user_id])
        redirect_to 'users_path'
      else
        @project = Project.new(user_id: params[:user_id])
      end
end

def create
   @project = Project.new(project_params)

   if @project.save
     redirect_to @project
   else
     render :new
   end
 end

 def update
    @project = Project.find(params[:id])

    @project.update(project_params)

    if @project.save
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
   @project = Project.find(params[:id])
   @project.destroy
   flash[:notice] = "Project deleted."
   redirect_to projects_path
 end

  private

  def project_params
   params.require(:project).permit(:title, :user_name, :user_id)
 end

end
