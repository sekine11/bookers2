class UsersController < ApplicationController
  before_action:authenticate_user!
  before_action :ensure_correct_user, {only: [:edit, :update]}
  def show
  	@books = Book.all
  	@book = Book.new
  	@user = User.find(params[:id])
  end
  def index
    @book = Book.new
  	@user = User.find(current_user.id)
  	@users = User.all
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end

  private
  def ensure_correct_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to user_path(current_user.id)
    end
  end
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
