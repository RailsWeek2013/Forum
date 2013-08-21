class AdminsController < ApplicationController

  before_action :admin_check
	before_action :setUsers , :setPosts , :setTopic , :setThread

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
  	post = @posts.find(params[:id])
  	post.spam = false
  	post.save
  	render action: :index
  end

  def new_posts

  end

  def spam_post

  end

  def threads

  end

  def topics

  end

  def users

  end

  def topic_edit
      @topic = Topic.find(params[:id])
  end

  def thread_edit
    @thread = UserThread.find(params[:id])
  end

  private 

  def setUsers
  	@users = User.all
  end

  def setPosts
  	@posts = Post.all
  end

  def setTopic
    @topic = Topic.all
  end

  def setThread
    @userThread = UserThread.all
  end

  def admin_check
    unless current_user.try(:admin?)
      redirect_to root_path
    end
  end

end
