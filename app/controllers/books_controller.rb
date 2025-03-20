class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @user = current_user
    @book.user_id = current_user.id
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @users = User.all
    @book = Book.new
    
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
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
    params.require(:book).permit(:title, :opinion, )
  end

  
end
