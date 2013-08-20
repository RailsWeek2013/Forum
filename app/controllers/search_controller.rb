class SearchController < ApplicationController
	before_action :setPosts
	helper_method :getPage

  def search
  	@results =  @posts.where("title like ?","%"+params[:search_field]+"%")
  	@contentResults = @posts.where("content like ?","%"+params[:search_field]+"%")
  end


  private 

  def setPosts
  	@posts = Post.all
  end

   def getPage n
  		page = @posts.where("id <= #{n.id}").all.count
  	 	(page/10.0).ceil

  end

end
