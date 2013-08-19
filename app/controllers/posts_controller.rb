class PostsController < ApplicationController
  before_action :set_post_topic
  before_action :set_post_user_thread
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = @userThread.posts.all
    @post = @userThread.posts.new
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = @userThread.posts.new
  end

  # GET /posts/1/edit
  def edit
  end

  def spam
    post = Post.find(params[:id])
    post.spam = true
    post.save
    redirect_to topic_user_thread_posts_path(@topic, @userThread)
  end

  # POST /posts
  def create
    @posts = @userThread.posts.all
    @post = @userThread.posts.new(post_params)
    @post.user = current_user
    

      if @post.save
        redirect_to topic_user_thread_posts_path(@topic,@userThread), notice: 'Post was successfully created.'
      else
        render action: 'index'
      end
  end

  # PATCH/PUT /posts/1
  def update
      if @post.update(post_params)
        redirect_to [@topic, @userThread, @post], notice: 'Post was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to topic_user_thread_posts_url
  end

  private

    def set_post_topic
      @topic = Topic.find(params[:topic_id])
    end

    def set_post_user_thread
      @userThread = @topic.user_threads.find(params[:user_thread_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = @userThread.posts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :spam, :user_thread_id, :rating)
    end
end
