module SearchHelper

  def getPage n
    page = @posts.where("id <= #{n.id}").all.count
    (page/10.0).ceil
  end

end
