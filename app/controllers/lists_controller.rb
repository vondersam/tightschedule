class ListsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @lists = List.all
    @lists = policy_scope(List)
  end

  def show
    @list = List.find(params[:id])
    @task = Task.new
    authorize @list
  end

  def destroy
    @list = List.find(params[:id])
    authorize @list
    @list.destroy
    respond_to do |format|
      format.html do
        redirect_to lists_path
      end
      format.js
    end
  end

  def create
    @list = List.new(list_params)
    authorize @list
    @list.user = current_user
    @last_list = List.last
    @lists = List.all
    if @list.save
      respond_to do |format|
        format.html { redirect_to lists_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'lists/index' }
        format.js
      end
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
