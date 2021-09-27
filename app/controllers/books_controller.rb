class BooksController < ApplicationController

  before_action :correct_edit,only: [:edit]

 def index
  @books = Book.all
  @users = User.all
  @book = Book.new
  #@user = current_user
 end

 def new
   @book = Book.new
 end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] ='You have created book successfully.'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      @book_new = Book.new
      render :edit
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @books = Book.all
    @users = User.all
    @user = current_user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def correct_edit
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
  end

  private
  #def user_params
    #params.require(:user).permit(:name,:profile_image,:introduction)
  #end

  def book_params
    params.require(:book).permit(:title,:body)
  end
end