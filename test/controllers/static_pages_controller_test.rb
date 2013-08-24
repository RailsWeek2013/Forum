require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get impressum" do
    get :impressum
    assert_response :success
  end

end
