class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end
  def index
  	@user = User.find(current_user.id)
  	@users = User.all
  end

end
