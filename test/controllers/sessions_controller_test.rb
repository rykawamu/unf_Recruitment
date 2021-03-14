require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  test "should get new" do
    get login_path
    assert_response :success
  end

  test "userid blank" do
    post login_path, params: { session: { name: "   ", password: "password"} }

    assert_not flash.empty?
    assert_not is_logged_in?
  end

  test "password blank" do
    post login_path, params: { session: { name: "one", password: "   "} }

    assert_not flash.empty?
    assert_not is_logged_in?
  end

  test "User does not exist" do
    post login_path, params: { session: { name: "zero", password: "password"} }

    assert_not flash.empty?
    assert_not is_logged_in?
  end

  test "User exist" do
    post login_path, params: { session: { name: "one", password: "password"} }

    assert is_logged_in?
  end
  
end
