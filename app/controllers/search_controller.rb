
class SearchController < ApplicationController

  def search
    if params[:search_field] == ''
      flash[:search_error] = 'Bitte geben Sie einen Suchbegriff ein!'
      redirect_to root_path
    else
      @postResults    = Post.all.where("title like ? or content like ?","%" + params[:search_field] + "%", "%" + params[:search_field] + "%" )
      @userResults    = User.all.where("email like ?","%" + params[:search_field] + "%")
      @threadResults  = UserThread.all.where("title like ?","%" + params[:search_field] + "%")
      @topicResults   = Topic.all.where("name like ?","%" + params[:search_field] + "%")
    end
  end

end
