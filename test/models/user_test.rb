require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(username: 'johndoe', first_name: 'John', last_name: 'Doe', email: 'johndoe@example.com')
  end

  test 'user is valid' do
    assert @user.valid?
  end

end
