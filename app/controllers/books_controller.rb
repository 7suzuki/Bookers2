class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create #データの保存
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id) #@bookにすることで今作ったbookになる
  end
  

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def update
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)

  end

end
