class UserController < ApplicationController

	def show_current_user
		if user_signed_in?
			@user = current_user
      @mythreads = @user.user_threads
			render action: 'show'
		else	
			redirect_to root_path
		end
	end

	def show
		if user_signed_in?
			@user = User.find(params[:id])
      @mythreads = @user.user_threads
		else
			redirect_to root_path
		end
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user

    p = date_params
    para = user_params
    para[:birthday] = Date.new(p[:year].to_i, p[:month].to_i, p[:day].to_i)

		if @user.update(para)
        	redirect_to show_current_user_path, notice: 'Profil erfolgreich geändert.'
      	else
        	render action: 'edit'
      end
  end

  def my_threads
    @mythreads = current_user.user_threads
  end


	private 
		def user_params
	     	params.require(:user).permit(:name, :lastname, :gender, :signature, :avatar, :remove_avatar)
    end

    def date_params
      params.require(:birth_day).permit(:year, :month, :day)
    end
end