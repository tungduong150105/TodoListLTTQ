class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end
  def create
    @task = Task.new(task_params)
    @task.completed = false
    @task.deleted = false
    if @task.save
      redirect_to root_path, notice: "Task was successfully created."
    else
      render :index
    end
  end
  def update_completed
    @task = Task.find(params[:id])
    @task.completed = true
    @task.save
    redirect_to root_path, notice: "Task was successfully updated."
  end
  def edit
    @task = Task.new
  end
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to root_path, notice: "Task was successfully updated."
    else
      render :edit
    end
  end
  def destroy
    @task = Task.find(params[:id])
    @task.deleted = true
    @task.save
    redirect_to root_path, notice: "Task was successfully destroyed."
  end
  private
  def task_params
    params.require(:task).permit(:description)
  end
end