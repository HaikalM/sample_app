require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
    @u1 = User.new(name: " ", email: "tst@gmail.com")
  end

  test "should be valid" do
    assert @user.valid?
    assert_not @u1.valid?
  end

  test "Name should be present" do
  	@user.name = "   "
  	assert_not @user.valid?
  end

  test "Email should be present" do
  	@user.email = "   "
  	assert_not @user.valid?
  end
end
