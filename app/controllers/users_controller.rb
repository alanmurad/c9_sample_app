class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
    # Handle a successful save.
    else
      render 'new'
    end
  end
  
  private 
    
    def user_params
      params.require.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
