class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def new
    @task = Task.new
    respond_to do |format|
      format.html { render layout: nil }
    end
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render status: 200, nothing: true
    else
      render status: 500, nothing: true
    end
  end

  def edit
    render layout: nil
  end

  def destroy
    if @task.destroy
      render status: 200, nothing: true
    else
      render status: 500, nothing: true
    end
  end

  def update
    if @task.update(task_params)
      render status: 200, nothing: true
    else
      render status: 500, nothing: true
    end
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:taskname, :describe, :anticipated,:status)
    end
end
