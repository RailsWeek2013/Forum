class UserThreadsController < ApplicationController
  before_action :set_user_thread_topic
  before_action :set_user_thread, only: [:show, :edit, :update, :destroy]

  # GET /user_threads
  def index
    @user_threads = @topic.user_threads.all
  end

  # GET /user_threads/1
  def show
  end

  # GET /user_threads/new
  def new
    @user_thread = @topic.user_threads.new
  end

  # GET /user_threads/1/edit
  def edit
  end

  # POST /user_threads
  def create
      @user_thread = @topic.user_threads.new(user_thread_params)
      @user_thread.user = current_user
      #@user_thread.topic = Topic.find(params[:topic_id]) # sollte er selber setzen

      if @user_thread.save
        #redirect_to action:'index', notice: 'User thread was successfully created.'
        redirect_to topic_user_threads_path(@topic), notice: 'User thread was successfully created.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /user_threads/1
  def update
      if @user_thread.update(user_thread_params)
        redirect_to action: 'index', notice: 'User thread was successfully updated.'
      else
        render 'admins/thread_edit'
      end
  end

  # DELETE /user_threads/1
  def destroy
    @user_thread.destroy
    redirect_to topic_user_threads_url
  end

  private

    def set_user_thread_topic
      @topic = Topic.find(params[:topic_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user_thread
      @user_thread = @topic.user_threads.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_thread_params
      params.require(:user_thread).permit(:title)
    end
end
