class UserController < ApplicationController

	def show_current_user
    direct_to root_path unless user_signed_in?

    @user       = current_user
    @mythreads  = @user.user_threads
    @my_received_messages = @user.received_messages
    @my_sent_messages     = @user.sent_messages
	end

	def show
    redirect_to root_path unless user_signed_in?

    begin
      @user = User.find(params[:id])

      if @user == current_user
        redirect_to show_current_user_path
      else
        @mythreads = @user.user_threads
      end
    rescue ActiveRecord::RecordNotFound => e
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