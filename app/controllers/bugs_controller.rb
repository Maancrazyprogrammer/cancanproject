class BugsController < ApplicationController
  before_action :authenticate_user!
  
  def index
   
    @bugs=Bug.all

  end

  def show
    @bug = Bug.find(params[:id])
  end
  def new
    @bug=Bug.new
   
  end

  def create
    @bug=Bug.new(bug_params)
    authorize! :create, @bug
    if @bug.save
      redirect_to @bug
    else
      render :new, status: 
    end
  end

 
  def edit
    @bug = Bug.find(params[:id])
    authorize! :update, @bug
  end

  def update
    @bug = Bug.find(params[:id])
    authorize! :update, @bug
    if @bug.update(bug_params)
      redirect_to @bug
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
    def bug_params
      params.require(:bug).permit(:bug_title,:bug_des,:user_id)
    end
  def destroy
  end
end
