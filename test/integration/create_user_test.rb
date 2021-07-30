require "test_helper"

class CreateUserTest < ActionDispatch::IntegrationTest
  setup do
  end

  test 'can create new user' do
    get signup_url
    assert_response :success
    assert_select 'label', 'Username', 'No form created'

    post users_url, params: { user: { username: 'johndoe', first_name: 'John', last_name: 'Doe', email: 'johndoe@example.com', password: 'password', password_confirmation: 'password'} }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'h1', 'Articles'
    
  end
end