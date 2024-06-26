class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:new, :create, :edit, :update]

  def new
    @book = Book.new
    @user = current_user
  end

  def create #データの保存
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id) #@bookにすることで今作ったbookになる
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)

  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
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
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

    def is_matching_login_user
      if params[:id]
        book = Book.find(params[:id])
        unless book.user.id == current_user.id
        redirect_to books_path
        end
      end
    end
end
