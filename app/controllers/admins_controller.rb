class AdminsController < ApplicationController

  before_action :admin_check

  layout "admin"


  def index
  end

  def destroy
    unless current_user.try(:admin?) 
  	  User.find(params[:id]).destroy
    else
      flash.now[:alert] = "Admin kann nicht geloescht werden"
    end
  	render action: :index

  end

  def noSpam
  	post = Post.find(params[:id])
  	post.spam = false
  	post.save
  	render action: :index
  end

  def new_posts
    @newPosts = Post.where("created_at > :day", {day: Time.now - 2.days})
  end

  def spam_post
    @posts = Post.where(spam: true)
  end

  def threads
    @userThread = UserThread.all
  end

  def topics
    @topic = Topic.all
  end

  def users
    @users = User.all
  end

  def topic_edit
      @topic = Topic.find(params[:id])
  end

  def thread_edit
    @thread = UserThread.find(params[:id])
  end


  private

    def admin_check
      unless current_user.try(:admin?)
        redirect_to root_path
      end
    end

end
