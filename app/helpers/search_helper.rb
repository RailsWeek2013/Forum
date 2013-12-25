module SearchHelper

  def getPage n
    page = n.user_thread.posts.where("id <= #{n.id}").all.count
    (page/10.0).ceil
  end

  def bootstrap_panel(title, &block)

      content_tag :div, class: 'panel panel-default' do
        content_tag :div, class: 'panel-body' do
          content_tag(:h2, title.to_s.html_safe) +
          content_tag(:div) { yield }
        end
      end

  end

end
