class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers, :show_banker]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy
  before_filter :banker_user,    only: :show_banker

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
       sign_in @user
       redirect_to @user
    else
       flash[:error] = "User Account Not Created, Please Try Again!"
       redirect_to root_path
    end
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
        sign_in @user
        flash[:success] = "User Profile updated"
        redirect_to @user
    else
        render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted!"
    redirect_to users_path
  end

  #Banker Account Actions:
  def show_banker
    @user = User.find(current_user)
    @total_credits = Credit.all.count
    @credits_in_bank = Credit.find_all_by_user_id(3).count
    @vendors = User.find_all_by_user_type(2)
    @credits_in_vendors = Credit.find_all_by_user_id(@vendors).count
    @players = User.find_all_by_user_type(1)
    @credits_in_players = Credit.find_all_by_user_id(@players).count
    @credits_in_pools = Credit.find_all_by_pool_id(!nil).count
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end

  def banker_user
    redirect_to root_path unless current_user.user_type == 3
  end
  
end