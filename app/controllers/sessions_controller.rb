class SessionsController < ApplicationController

	def new
    @user = User.new
    render :new
	end

	def create
    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to @user
    else
      redirect_to new_session_path
    end
	end

	def destroy
    logout
    redirect_to root_path
	end

  private  
    def user_params
      params.require(:user).permit(:email, :password)
    end

end