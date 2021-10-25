class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    @task_types = TaskType.all
    @users = User.all
  end

  def create
    @users = User.all
    @task = Task.create!(task_params)
    if @task.save
      redirect_to tasks_path(@task.id)
    else
      render :new
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(task_params)
      redirect_to tasks_path(@task.id)
    else
      render :edit
    end
  end

  # def show
  #   @tasks = Task.all
  # end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to task_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :toUser_id, :fromUser_id, :type_id, :status_id, comments_attributes: %i[name _destroy])
  end
end
