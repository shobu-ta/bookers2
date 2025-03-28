class BooksController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      @books = Book.all
      render :index
    end
  end

  def new
    @book = Book.new
    @books = Book.all
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @booknew = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end