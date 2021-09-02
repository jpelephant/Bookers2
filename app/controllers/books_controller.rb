class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to post_images_path
  end

  def index
    @book = Book.all
  end

  def show
    @book = Book.find(params[id])
  end

  def destroy
    @book = Book.find(params[:id])
    @boook.destroy
    redirect_to book_path
  end

   private

  def book_params
    params.require(:book).permit(:shop_name, :image, :caption)
  end
end
