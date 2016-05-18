class TaskListsController < ApplicationController
  before_action :authenticate_user!

  def new
    @task = TaskList.new
  end

  def create
    @task = TaskList.new(task_params)
    @task.update_attribute("user", current_user)
    if @task.save!
      flash[:success] = "Task created successfully"
      render :show
    else
      flash[:error] = @task.errors.full_messages
      redirect_to new_task_list_path
    end
  end

  def show
    @task = TaskList.find params[:id]
  end

  def edit
    @task = TaskList.find params[:id]
  end

  def update
    @task = TaskList.find params[:id]
    @task.update(task_params)
    redirect_to projects_path
  end

  def destroy
     @task = TaskList.find params[:id]
     @task.destroy!
     redirect_to projects_path
  end

  private

  def task_params
    params.require(:task_list).permit(:description)
  end
end