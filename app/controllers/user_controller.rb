class UserController < ApplicationController

  before_action :authenticate_user!
  before_action :set_current_user
  before_action :get_new_message_count


	def current_user_profil
  end

  def current_user_messages
    @my_received_messages = @user.received_messages
    @my_sent_messages     = @user.sent_messages
  end

  def current_user_threads
    @mythreads = @user.user_threads
  end

	def show
    redirect_to root_path unless user_signed_in?

    begin
      @user = User.find(params[:id])

      if @user == current_user
        redirect_to current_user_path
      else
        @mythreads = @user.user_threads
      end
    rescue ActiveRecord::RecordNotFound => e
      redirect_to root_path
    end

	end

	def edit
	end

	def update
    p = date_params
    para = user_params
    para[:birthday] = Date.new(p[:year].to_i, p[:month].to_i, p[:day].to_i)

		if @user.update(para)
        	redirect_to current_user_path, notice: 'Profil erfolgreich geändert.'
      	else
        	render action: 'edit'
      end
  end

	private 
		def user_params
	     	params.require(:user).permit(:name, :lastname, :gender, :signature, :avatar, :remove_avatar)
    end

    def date_params
      params.require(:birth_day).permit(:year, :month, :day)
    end

    def get_new_message_count
      @new_message_count = @user.received_messages.where(readed: true).count
    end

    def set_current_user
      @user = current_user
    end
end