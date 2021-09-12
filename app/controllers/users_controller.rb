class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      redirect_to books_path notice: 'You have updated user successfully.'
    else
       flash.now[:alert] = ' error prohibited this obj from being saved:'
       render :User.find(params[:id])
    end
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
  end

  def edit
    @user =User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

  def book_params
    params.require(:book).permit(:title,:opinion)
  end
end
