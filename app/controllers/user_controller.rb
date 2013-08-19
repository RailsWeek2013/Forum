class UserController < ApplicationController

	def show_current_user
		@user = current_user
		render action: 'show'
	end

	def show
		@user = User.find(params[:id])
	end

end