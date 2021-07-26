require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(username: 'johndoe', first_name: 'John', last_name: 'Doe', email: 'johndoe@example.com', password: 'password', password_confirmation: 'password')
  end

  test 'user is valid' do
    assert @user.valid?
  end

  test "should not save user without first name" do
    @user.first_name = ''
    assert_not @user.valid?, 'Saved user without first name'
  end

  test "should not save user without last name" do
    @user.last_name = '   '
    assert_not @user.valid?, 'Saved user without last name'
  end

  test "should not save user without username" do
    @user.username = ' '
    assert_not @user.valid?, 'Saved user without username'
  end

  test "should not save user without email" do
    @user.email = ' '
    assert_not @user.valid?, 'Saved user without email'
  end

  test "user should be save in lowercase" do
    mixed_case_username = 'joHnDoe'
    @user.username = mixed_case_username
    @user.save
    assert_equal mixed_case_username.downcase, @user.reload.username
  end

  test "username should be unique" do
    @user.save
    duplicate_user = User.new(username: 'janedoe', first_name: 'Jane', last_name: 'Doe', email: 'janedoe@example.com')
    duplicate_user.username = @user.username
    assert_not duplicate_user.valid?
  end
  
  test "email should be unique" do
    @user.save
    duplicate_user = User.new(username: 'janedoe', first_name: 'Jane', last_name: 'Doe', email: 'janedoe@example.com')
    duplicate_user.email = @user.email.upcase
    assert_not duplicate_user.valid?
  end

  test 'should not save user without password' do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?, 'Saved user without password'
  end

  test 'should not save password if password confirmation does not match' do
    @user.password_digest = ''
    @user.password_confirmation = 'no match'
    assert_not @user.valid?, 'Saved user with password confirmation not matching'
  end

end
