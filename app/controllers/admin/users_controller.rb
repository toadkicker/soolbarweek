class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :get_user, only: [:edit, :update]
  before_action :allow_without_password, only: [:update]

  def index
    @users = User.order(:is_admin)
  end

  def show
    redirect_to admin_users_url
  end

  def edit
  end

  def new
    @user = User.new
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_url, notice: "#{@user.name} was successfully updated." }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :confirm_password, :photo, :email)
  end

  def allow_without_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end
end
