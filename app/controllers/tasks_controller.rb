class TasksController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :list_set

  def create
    @task = Task.new(task_params)
    authorize @task
    @task.list = @list
    if @task.save
      respond_to do |format|
        format.html { redirect_to list_path(@list) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'lists/show' }
        format.js
      end
    end
  end


  def destroy
    @task = @list.tasks.find(params[:id])
    authorize @task
    @task.destroy
    respond_to do |format|
      format.html do
        redirect_to list_path(@list)
      end
      format.js
    end
  end

  def complete
    @task = @list.tasks.find(params[:id])
    authorize @task
    @task.update_attribute(:completed, true)
    redirect_to list_path(@list), notice: "todo complete"
  end

  private

  def list_set
     @list = List.find(params[:list_id])
  end

  def task_params
    params.require(:task).permit(:content, :duedate, :completed)
  end
end
