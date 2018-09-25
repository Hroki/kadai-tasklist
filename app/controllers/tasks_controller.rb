class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end 
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create 
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'taskが正常に投稿されました'
    redirect_to @task
    
    else
      flash.now[:danger] = 'taskが投稿されませんでした'
      
    render :new
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'taskは正常に更新されました'
    redirect_to @task
      
    else
      flash.now[:danger] = 'taskは更新されませんでした'
      
      render :new
    end 
  end

private

def task_params
  params.require(:task).permit(:content)
end
end
