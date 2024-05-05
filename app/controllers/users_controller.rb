class UsersController < ApplicationController
  
  # def new  end SignInで不要？
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    
  end
  
  def edit
    
  end
  
  def update
  
  end
  
  # def create  end
  # def destory  end
  
end
