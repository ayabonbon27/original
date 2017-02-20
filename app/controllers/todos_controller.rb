class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update , :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def new
    @user = current_user
    @todo = @user.todos.build
  end
  
  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      flash[:success] = "新しいリストを作成しました！"
      redirect_to current_user
    else
      @user = current_user
      render 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    if @todo.update(todo_params)
      flash[:success] = "更新しました。"
      redirect_to current_user
    else
      @user = current_user
      render 'edit'
    end
  end
  
  def destroy
    @todo.destroy
    flash[:success] = "診断を削除しました"
    redirect_to root_url
  end
  
  
  private
  
  def todo_params
    params.require(:todo).permit(:content, :age, :cost ,:completed, :completion_date)
  end
  
  def set_todo
     @todo = Todo.find(params[:id])
  end
  
  def correct_user
    if @todo.user != current_user
      flash[:danger] = "不正なアクセスです。"
      redirect_to root_url
    end
  end
end

