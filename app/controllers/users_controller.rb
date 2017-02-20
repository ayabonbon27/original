class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :followings, :followers]
  before_action :correct_user, only: [:edit, :update]
  
  def show
    @todos = @user.todos.order(age: :asc).page(params[:page]).per(15)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "更新しました。"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :profile, :password,:status,:password_confirmation)
  end
  
  def set_user
   @user = User.find(params[:id])
  end
  
  def correct_user
    if @user != current_user
      flash[:danger] = "不正なアクセスです。"
      redirect_to root_path
    end
  end
end
