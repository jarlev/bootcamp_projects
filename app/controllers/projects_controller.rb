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
  	if @project.save!
  		current_user.people.create project: @project
  		flash[:success] = "Project created successfully"
  		render :show
  	else
  		flash[:error] = @project.errors.full_messages
  		redirect_to new_project_path
  	end
  end

  def show
  	@project = Project.find params[:id]
      @tasks = @project.task_lists
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

  def create_task_list
    @task = TaskList.new(task_params)
    @project = Project.find params[:id]
    @task.update(user: current_user, project: @project)
    @tasks = @project.task_lists
    render :show
  end

  private

  def project_params
  	params.require(:project).permit(:name, :due_date, :repo_name)
  end

  def task_params
    params.require(:task_list).permit(:task_name, :task_description, :priority)
  end

end
