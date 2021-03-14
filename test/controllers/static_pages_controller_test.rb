require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  test "should get root" do
    user_logged_in

    get root_path
    assert_response :success
  end

  test "should get about" do
    user_logged_in

    get about_path
    assert_response :success
  end

end
