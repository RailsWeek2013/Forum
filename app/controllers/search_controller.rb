class SearchController < ApplicationController
	before_action :setPosts
	before_action :setUsers
	before_action :setThreads
	before_action :setTopics

  def search
  	@results =  @posts.where("title like ?","%"+params[:search_field]+"%")
  	@contentResults = @posts.where("content like ?","%"+params[:search_field]+"%")
  	@userResults = @users.where("email like ?","%"+params[:search_field]+"%")
  	@threadResults = @threads.where("title like ?","%"+params[:search_field]+"%")
  	@topicResults = @topics.where("name like ?","%"+params[:search_field]+"%")
  end

  private 

  def setPosts
  	@posts = Post.all
  end

  def setUsers
  	@users = User.all
  end

  def setThreads
  	@threads = UserThread.all
  end

  def setTopics
  	@topics = Topic.all
  end
end
