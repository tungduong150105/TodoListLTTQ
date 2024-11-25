class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
    @taskD = Task.order(:completed)
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers["Content-Disposition"] = "attachment; filename=\"Task#{Time.now.strftime("-%Y-%m-%d")}.xlsx\""
      }
    end
  end
  def create
    @task = Task.new(task_params)
    if @task.description == ""
      redirect_to root_path, alert: "Task must have description."
    else
      @task.completed = false
      @task.deleted = false
      @task.save
      redirect_to root_path, notice: "Task was successfully created."
    end
  end
  def update_completed
    @task = Task.find(params[:id])
    @task.completed = true
    @task.save
    redirect_to root_path
  end
  def edit
    @task = Task.new
  end
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to root_path, notice: "Task was successfully updated."
    end
  end
  def destroy
    @task = Task.find(params[:id])
    @task.deleted = true
    @task.save
    redirect_to root_path, notice: "Task was successfully destroyed."
  end
  def import
    Task.import(params[:file])
    redirect_to root_path, notice: "Tasks imported."
  end
  private
  def task_params
    params.require(:task).permit(:description)
  end
end
