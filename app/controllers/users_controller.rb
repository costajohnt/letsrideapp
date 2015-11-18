class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
    render :show
	end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params_edit)
     redirect_to @user
    else
      render :edit
    end
  end

  private
  	def user_params
  		params.require(:user).permit(:email, :password, :password_confirmation, :name)
  	end

  	def user_params_edit
  		params.require(:user).permit(:email, :name)
  	end

end
