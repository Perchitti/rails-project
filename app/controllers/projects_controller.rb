class ProjectsController < ApplicationController
  def index
      if logged_in?
        @user = current_user
        if @user.nil?
          redirect_to '/' #alert: "User not found"
        else
          @projects = @user.projects
        end
      else
        @projects = Project.all
      end
    end

    def new
      if session[:user_id] && !User.exists?(session[:user_id])
          redirect_to project_show_path
      else
        @project = Project.new(user_id: session[:user_id])
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

    def show
      if session[:user_id]
      @user = User.find_by(id: session[:user_id])
      @project = @user.projects.find_by(id: params[:id])
      if @project.nil?
        redirect_to project_path(@user) #alert: "Project not found"
      end
    else
    redirect_to '/edit'
    end
  end


 def edit
   if logged_in?
     @user = current_user
     if @user.nil?
       redirect_to '/'
     else
       @project = @user.projects.find_by(params[:id])
       redirect_to edit_project_path if @project.nil?
     end
   else
     @project = Project.find(params[:id])
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
   redirect_to projects_path
 end

  private

  def project_params
   params.require(:project).permit(:title, :user_name, :user_id)
 end

end
