class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show, :index, :show]
  def index
    @users = User.all.where.not(id: session[:user_id])  
    @num = @users.count
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user
    else 
      flash[:danger]= "User not found"
      redirect_to register_path
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success]= "Register success"
      redirect_to @user
    else
      render :new
    end
  end

  def update    
    @user = User.find_by id: params[:id]
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    data = User.find(params[:id])
    data.destroy
    redirect_to users_path
  end

  private
  def logged_in_user
    if !session[:user_id]
      redirect_to new_path
    end
  end

  def user_params
    params.require(:user).permit :user_id, :username, :email, :password, :password_confirmation, :birthdate, :is_admin, :is_active
  end
end
