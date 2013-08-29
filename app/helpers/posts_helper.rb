module PostsHelper

  def path_to_post(post)
    topic_user_thread_posts_path(post.topic, post.user_thread, anchor: post.postTagId, page: post.getPage)
  end

end
