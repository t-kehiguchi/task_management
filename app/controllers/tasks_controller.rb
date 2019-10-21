class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(name: params[:name], description: params[:description], user_id: params[:user_id])
    if @task.save
      flash[:success] = "タスクを新規登録しました！"
      redirect_to user_tasks_url(@task.user_id)
    else
      render :new
    end
  end
  
  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks.order(id: "DESC")
  end

  def edit
    @task = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.name = params[:name]
    @task.description = params[:description]
    if @task.save
      flash[:success] = "タスクを更新しました！"
      redirect_to user_task_url @task
    else
      render :edit      
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "タスクを削除しました！"
    redirect_to user_tasks_url(@task.user_id, @task.id)
  end

end