class AdminsController < ApplicationController

	before_action :setUsers

  def index
  	if current_user.try(:admin?)

  	else
  		redirect_to root_path
  	end

  end

  def destroy
  	User.find(params[:id]).destroy
  	render action: :index
  end

  def edit

  end

  private 

  def setUsers
  	@users = User.all
  end

end
