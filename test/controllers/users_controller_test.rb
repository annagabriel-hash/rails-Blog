require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new(username: 'johndoe', first_name: 'John', last_name: 'Doe', email: 'johndoe@example.com', password: 'password', password_confirmation: 'password')
  end

  test 'should get new' do
    get signup_url
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count', 1) do
      post users_url, params: { user: { username: @user.username, first_name: @user.first_name, last_name: @user.last_name, email: @user.email, password: @user.password, password_confirmation: @user.password_confirmation} }
    end
    assert_redirected_to articles_path
  end

end