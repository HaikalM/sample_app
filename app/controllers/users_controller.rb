class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	# debugger
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      # redirect_to user_url(@user)
      log_in @user
      flash[:success] = "Welcome To The Sample App!"
      redirect_to @user
  	else
  		render 'new'
  	end
# My comment 
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
