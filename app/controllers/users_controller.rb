class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user.destroy!

    respond_to do |format|
      format.json { respond_to_destroy(:ajax) }
      format.xml  { head :ok }
      format.html { respond_to_destroy(:html) }
    end

  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:json, :xml, :html)
  end

  def update
    User.find(params[:id]).update_attributes(params[:user])
    redirect_to users_path
  end

end