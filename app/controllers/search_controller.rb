class SearchController < ApplicationController
	before_action :setPosts

  def search
  	@results =  @posts.where("title like ?","%"+params[:search_field]+"%")
  	@contentResults = @posts.where("content like ?","%"+params[:search_field]+"%")
  end

  private 

  def setPosts
  	@posts = Post.all
  end
end
