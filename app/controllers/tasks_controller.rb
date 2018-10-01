class TasksController < ApplicationController
  def index
    @tasks = Task.all.page(params[:page]).per(5)
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
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = "Taskは正常に削除されました"
    redirect_to tasks_url
  end
  
private

def set_task
  @task = Task.find(params[:id])
end

def task_params
  params.require(:task).permit(:content, :status)
end
end

