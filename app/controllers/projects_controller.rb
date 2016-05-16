class ProjectsController < ApplicationController
	before_action :authenticate_user!

  def new
  	@project = Project.new
  end

  def index
  	@projects = current_user.projects
  end

  def create
  	@project = Project.new(project_params)
  	@project.update_attribute("user", current_user)
  	if @project.save!
  		flash[:success] = "Project created successfully"
  		render :show
  	else
  		flash[:error] = @project.errors.full_messages
  		redirect_to new_project_path
  	end
  end

  def show
  	@project = Project.find params[:id]
  end

  def edit
  	@project = Project.find params[:id]
  end

  def update
  	@project = Project.find params[:id]
  	@project.update(project_params)
  	redirect_to projects_path
  end

  def destroy
  	 @project = Project.find params[:id]
  	 @project.destroy!
  	 redirect_to projects_path
  end

  private

  def project_params
  	params.require(:project).permit(:name, :due_date, :repo_name)
  end

end
