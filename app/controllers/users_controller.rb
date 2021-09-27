class UsersController < ApplicationController

  before_action :correct_edit,only: [:edit]

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = ' error prohibited this obj from being saved:'
      render :edit
    end
  end

  def correct_edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
end
