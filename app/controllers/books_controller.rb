class BooksController < ApplicationController
  def index
    @books = Book.paginate page: params[:page], per_page: 20
  end

  def show
    @book = Book.find params[:id]
    @reviews = @book.reviews.paginate page: params[:page], per_page: 10
  end
end
