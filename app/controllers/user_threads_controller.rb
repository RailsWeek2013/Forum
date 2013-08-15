class UserThreadsController < ApplicationController
  before_action :set_user_thread, only: [:show, :edit, :update, :destroy]

  # GET /user_threads
  def index
    @user_threads = Topic.find(params[:topic_id]).userThreads.all
  end

  # GET /user_threads/1
  def show
  end

  # GET /user_threads/new
  def new
    @user_thread = Topic.find(params[:topic_id]).userThreads.new
  end

  # GET /user_threads/1/edit
  def edit
  end

  # POST /user_threads
  def create
      @user_thread = UserThread.new(user_thread_params)
      @user_thread.topic = Topic.find(params[:topic_id])

      if @user_thread.save
        redirect_to [@user_thread.topic, @user_thread], notice: 'User thread was successfully created.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /user_threads/1
  def update
      if @user_thread.update(user_thread_params)
        redirect_to [@user_thread.topic, @user_thread], notice: 'User thread was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /user_threads/1
  def destroy
    @user_thread.destroy
    redirect_to topic_user_threads_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_thread
      @user_thread = Topic.find(params[:topic_id]).userThreads.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_thread_params
      params.require(:user_thread).permit(:title)
    end
end
