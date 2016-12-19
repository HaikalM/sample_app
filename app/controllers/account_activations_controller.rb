class AccountActivationsController < ApplicationController

	def edit
	    user = User.find_by(email: params[:email])
	    if user && !user.activated? && user.authenticated?(:activation, params[:id])
	      user.activate
	      log_in user
	      flash[:success] = "Akun telah diaktifasi"
	      redirect_to user
	    else
	      flash[:danger] = "Link aktifasi tidak valid"
	      redirect_to root_url
	    end
  	end

end
