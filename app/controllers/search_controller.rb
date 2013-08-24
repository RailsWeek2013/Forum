class SearchController < ApplicationController
	before_action :setPosts
	before_action :setUsers

  def search
  	@results =  @posts.where("title like ?","%"+params[:search_field]+"%")
  	@contentResults = @posts.where("content like ?","%"+params[:search_field]+"%")
  	@userResults = @users.where("email like ?","%"+params[:search_field]+"%")
  end

  private 

  def setPosts
  	@posts = Post.all
  end

  def setUsers
  	@users = User.all
  end
end
