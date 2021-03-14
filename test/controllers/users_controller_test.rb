require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    user_logged_in

    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user (Not logged in)" do
    get signup_path
    assert_difference 'User.count',1 do
      post signup_path, params: { user: { email: "hanako@example.com", 
                                        name: "hanako",
                                        password: "password",
                                        password_confirmation: "password" } }
    end

    #assert_redirected_to user_url(User.last)
    assert_redirected_to login_path
  end

  test "should create user (Logged in)" do
    user_logged_in

    get signup_path
    assert_difference 'User.count',1 do
      post signup_path, params: { user: { email: "hanako@example.com", 
                                        name: "hanako",
                                        password: "password",
                                        password_confirmation: "password" } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    user_logged_in

    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    user_logged_in

    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    user_logged_in

    patch user_url(@user), params: { user: { email: @user.email,
                            name: @user.name,
                            password: "boobar",
                            password_confirmation: "boobar" } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    user_logged_in

    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
