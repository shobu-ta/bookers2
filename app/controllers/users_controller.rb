class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update]
  
   def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books  
  end
    
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice: "Profile updated successfully!"
    else
      render :edit  # バリデーションエラー時に編集ページを再表示
    end
  end


  private

  def find_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end