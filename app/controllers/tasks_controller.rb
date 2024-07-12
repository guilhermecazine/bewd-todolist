class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render :create, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    if @task&.destroy
      render json: { success: true }
    else
      render json: { success: false }, status: :not_found
    end
  end

  def mark_complete
    @task = Task.find_by(id: params[:id])
    if @task&.update(completed: true)
      render :mark_complete
    else
      render json: { errors: @task.errors }, status: :unprocessable_entity
    end
  end

  def mark_active
    @task = Task.find_by(id: params[:id])
    if @task&.update(completed: false)
      render :mark_active
    else
      render json: { errors: @task.errors }, status: :unprocessable_entity
    end
  end

  private
  
  def task_params
    params.require(:task).permit(:content)
  end
end
