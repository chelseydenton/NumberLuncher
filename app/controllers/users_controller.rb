class UsersController < ApplicationController
  include SessionsHelper
  before_action :signed_in_user, 
    only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :signed_in_bad_action, only: [:new, :create]

  def show
    @user = User.find(params[:id])
    @observation  = @user.observations.build
    @observations = @user.observations.paginate(page: params[:page])
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user?(@user)
      redirect_to users_path, notice: "You can't destroy yourself."
    else
      @user.destroy
      flash[:success] = "User deleted."
      redirect_to users_url
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation)
    end

    # Before filters

    def signed_in_bad_action
      redirect_to(root_url) unless !signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end


end
