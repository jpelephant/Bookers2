class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if @book.save
    redirect_to books_path notice: 'You have created book successfully.'
  else
    flash.now[:alert] = ' error prohibited this obj from being saved:'
     render :index
  end
  end

  def index
    @books = Book.all
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @book = book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
    @users = User.all
    @user = current_user
  end

  def destroy
    @book = Book.find(params[:id])
    @boook.destroy
    redirect_to book_path
  end

   private

  #def user_params
    #params.require(:user).permit(:name,:profile_image,:introduction)
  #end

  def book_params
    params.require(:book).permit(:title,:opinion)
  end
end
