class TasksController < ApplicationController
  before_action :authenticate_user!
 
  def index
  
    @tasks=Task.all
    # authorize! :read, @tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task=Task.new
  end

  def create
    @task=Task.new(task_params)
    authorize! :create, @task
    if @task.save
      redirect_to @task
    else
      render :new, status: 
    end
  end

  def edit
    @task = Task.find(params[:id])
    authorize! :update, @task
  end

  def update
    @task = Task.find(params[:id])
    authorize! :update, @task
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit, status: :unprocessable_entity
    end
  end
 
  private
    def task_params
      params.require(:task).permit(:task_title,:task_des,:user_id)
    end
  
end