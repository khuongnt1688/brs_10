class BookStatesController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = Book.find params[:book_id]
    @book_state = BookState.new
    respond_to do |format|
      format.js 
    end
  end

  def create
    @book = Book.find params[:book_id]
    @book_state = BookState.new book_state_params
    @book_state.user = current_user
    @book_state.book = @book
    if @book_state.save
      respond_to do |format|
        format.js 
      end
    end
  end

  def edit
    @book = Book.find params[:book_id]
    @book_state = BookState.find params[:id]
    respond_to do |format|
      format.js 
    end
  end

  def update
    @book = Book.find params[:book_id]
    @book_state = BookState.find params[:id]
    if @book_state.update_attributes book_state_params
      respond_to do |format|
        format.js 
      end
    end
  end

  private
  def book_state_params
    params.require(:book_state).permit :state
  end
end
