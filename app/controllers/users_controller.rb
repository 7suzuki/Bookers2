class UsersController < ApplicationController

  # def new  end SignInで不要？

  def show
    # @books = Book.all
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new

    # @profile_images = @user.profile_images #(全件取得)
    # @post_images = @user.post_images.page(params[:page]) #ページネーション（取得数制限）
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to books_path #ユーザーの詳細ページに画面遷移
    else
      render :edit
    end
  end

  # def create  end
  # def destory  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
