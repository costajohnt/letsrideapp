class UsersController < ApplicationController

	def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params_edit)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @rides = Ride.all
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end

    def user_params_edit
      params.require(:user).permit(:email, :name, :password)
    end
    
end
