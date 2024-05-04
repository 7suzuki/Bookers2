class BooksController < ApplicationController

  def new
    book = Book.new
  end
  
  def create #データの保存
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path
  end
  
  def show
    
  end
  
  def index
    
  end
  
  def edit
    
  end
  

  # def destory  end
  # def update  end
  
  private
  
  def book_params
    params.require(:book).permit(:book_name, :image, :caption)
    
  end
  
end
