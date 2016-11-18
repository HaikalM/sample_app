# My comment on tuts+ 
require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	# test "the truth" do
	#   assert true
	# end
	test "invalid signup information" do
	get signup_path
		assert_difference 'User.count', 1 do
			post signup_path, params: {user: {name: "Maulana Haikal", email: "user@example.com", password: "tes123", password_confirmation: "tes123"}}
		end
	follow_redirect!  
	assert_template 'users/show'
	assert_not flash[:failed]
	end
end
