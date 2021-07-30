require "test_helper"

class CreateUserTest < ActionDispatch::IntegrationTest
  setup do
    get signup_url
    assert_response :success
    assert_select 'label', 'Username', 'No form created'
  end

  test 'can create new user with valid inputs' do
    post users_url, params: { user: { username: 'johndoe', first_name: 'John', last_name: 'Doe', email: 'johndoe@example.com', password: 'password', password_confirmation: 'password'} }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'h1', 'Articles'
  end

  test 'cannot create new user with invalid inputs' do
    post users_url, params: { user: { username: '', first_name: 'John', last_name: 'Doe', email: 'johndoe@example.com', password: 'password', password_confirmation: 'password'} }
    assert_select 'li', "Username can't be blank", 'Errors not displaying'
  end
end