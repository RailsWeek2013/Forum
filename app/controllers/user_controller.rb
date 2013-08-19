class UserController < ApplicationController

	def show_current_user
		if user_signed_in?
			@user = current_user
			render action: 'show'
		else	
			redirect_to root_path
		end
	end

	def show
		if user_signed_in?
			@user = User.find(params[:id])
		else
			redirect_to root_path
		end
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		
		if @user.update(user_params)
        	redirect_to show_current_user_path, notice: 'Profil erfolgreich geändert.'
      	else
        	render action: 'edit'
      end
	end


	private 
		def user_params
	     	params.require(:user).permit(:name, :lastname)
	    end

end