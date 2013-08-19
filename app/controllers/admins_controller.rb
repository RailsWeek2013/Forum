class AdminsController < ApplicationController

	before_action :setUsers , :setPosts , :setTopic

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


  def noSpam
  	post = @posts.find(params[:id])
  	post.spam = false
  	post.save
  	render action: :index
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


end
