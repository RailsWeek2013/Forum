class AdminsController < ApplicationController

  before_action :admin_check
 

  layout "admin"


  def index
  end

  def destroy
    unless User.find(params[:id]).admin? 
  	  User.find(params[:id]).destroy
    else
      flash.now[:alert] = "Admin kann nicht geloescht werden"
    end

  	redirect_to action: 'users'
  end

  def noSpam
  	post = Post.find(params[:id])
  	post.spam = false
  	post.save
    redirect_to action: 'spam_post'
  end

  def new_posts
    @newPosts = Post.where("created_at > :day", {day: Time.now - 2.days})
  end

  def spam_post
    @posts = Post.where(spam: true)
  end

  def topics_threads
    @userThread = UserThread.all
    @topic = Topic.all
  end

  def users
    @users = User.all
  end

  def topic_edit
      @topic = Topic.find(params[:id])
  end

  def thread_edit
    @user_thread = UserThread.find(params[:id])
  end

  def thread_move
    @options = Topic.all
  end

  def thread_moved
    userT = UserThread.find(params[:id])
    userT.topic = Topic.find(params[:user_thread][:topic])
    userT.save
    redirect_to admin_topics_threads_path
  end


  private

    def admin_check
      unless current_user.try(:admin?)
        redirect_to root_path
      end
    end


end
