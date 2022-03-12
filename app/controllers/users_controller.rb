class UsersController < ApplicationController
  before_action :set_user, only: %i(show)
  before_action :set_one_month, only: %i(show)
  # before_action :all_set_one_month, %i(show)

  def show
    redirect_back(fallback_location: root_path) #元のページに戻る
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    item_id = Item.find(code: params[:schedule][:item_id]).id
    Schedule.create(site_params.merge(item_id: item_id))
  end

  def destroy 
  
  end
  
  def go_work
    @schedules = Schedule.includes(:user).where(worked_on: Time.current).
    where('schedules.started_at IS NOT NULL').
    where('schedules.finished_at IS NULL')
    # where('schedules.site_name IS NULL')
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :nearest_station, :phone_number)
  end

end
