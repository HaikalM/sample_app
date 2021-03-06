require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:haikal)
  end

  test "unsuccessfull edit" do
  	log_in_as(@user)
  	get edit_user_path(@user)
  	assert_template 'users/edit'
  	patch user_path(@user), params: { user: { name: "",
  											  email: "foo@invalid",
  											  password: "foo",
  											  password_confirmation: "bar" }}
  	assert_template 'users/edit'
  	assert_select 'div.alert', text: "The form contains 4 errors", count: 1
  end

  test 'successfull edit' do
  	log_in_as(@user)
  	get edit_user_path(@user)
  	assert_template 'users/edit'
  	name = "haikal2"
  	email = "haikal2@example.com"
  	patch user_path(@user), params: { user: { name: name,
  											  email: email,
  											  password: "",
  											  password_confirmation: "" }}
  	assert_not flash.empty?
  	assert_redirected_to @user
  	@user.reload
  	assert_equal name,  @user.name
  	assert_equal email, @user.email
  end

  test "successfull edit with friendly forwading" do
  	get edit_user_path(@user)
  	log_in_as(@user)
  	assert_redirected_to edit_user_path(@user)
  	name = "test"
  	email = "email@example.com"
  	patch user_path(@user), params: { user: { name: name,
  											  email: email,
  											  password: "",
  											  password_confirmation: ""} }
  	assert_not flash.empty?
  	assert_redirected_to @user
  	@user.reload
  	assert_equal name, @user.name
  	assert_equal email, @user.email
  end
end
