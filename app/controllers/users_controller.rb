class UsersController < ApplicationController
  before_action :set_user, only: %i(show)
  before_action :set_one_month, only: %i(show)
  # before_action :all_set_one_month, %i(show)

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy 
  
  end

 

  # def update
  #   @user = User.find(params[:id])
  #   if @user.id == current_user.id
  #     @user.update(user_params)
  #     flash[:success] = "プロフィールが更新されました！"
  #     redirect_to user_path(@user)
  #   else
  #     render root_path
  #   end
  # end
  # def create
  #   @user = User.new(params[:user])
  #   if @user.save
  #     redirect_to user
  #   else
  #     flash.now[:danger] = '認証に失敗しました。'
  #     render :new
  #   end
  # end

  def go_work
    @now_users = User.includes(:schedules).references(:schedules).
    where('schedules.started_at IS NOT NULL').
    where('schedules.finished_at IS NULL')
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :nearest_station, :phone_number, :image)
  end
end