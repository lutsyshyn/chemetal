class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end

  def update
    User.find(params[:id]).update_attributes(params[:user])
    redirect_to users_path
  end

end