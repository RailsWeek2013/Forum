require 'test_helper'

class UserThreadsControllerTest < ActionController::TestCase
  setup do
    @user_thread = user_threads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_threads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_thread" do
    assert_difference('UserThread.count') do
      post :create, user_thread: { title: @user_thread.title, topic: @user_thread.topic }
    end

    assert_redirected_to user_thread_path(assigns(:user_thread))
  end

  test "should show user_thread" do
    get :show, id: @user_thread
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_thread
    assert_response :success
  end

  test "should update user_thread" do
    patch :update, id: @user_thread, user_thread: { title: @user_thread.title, topic: @user_thread.topic }
    assert_redirected_to user_thread_path(assigns(:user_thread))
  end

  test "should destroy user_thread" do
    assert_difference('UserThread.count', -1) do
      delete :destroy, id: @user_thread
    end

    assert_redirected_to user_threads_path
  end
end
