class UsersController < ApplicationController
  before_action :set_user, only: %i(show)
  before_action :set_one_month, only: %i(show, update)
  before_action :all_set_one_month, only: %i(show)
  before_action :show, only: %i(go_work)

  def show
    @user = User.find(params[:id])
    @schedules = @user.schedules.all.order(:worked_on)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy 
  
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # 保存に成功した場合は、ここに記述した処理が実行されます。
      redirect_to :show
    else
      render :new
    end
  end

  def go_work
    # @now_users = User.includes(:schedules).references(:schedules).
    # where('schedules.started_at IS NOT NULL').
    # where('schedules.finished_at IS NULL')
    # *は全てのカラム
    @now_users = User.joins("LEFT JOIN schedules ON users.id = schedules.user_id")
                     .select("users.*, schedules.site_name")
                     .where("schedules.started_at IS NOT NULL AND schedules.finished_at IS NULL")
                     .order("users.id DESC")
                     
  end
  

  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :nearest_station, :phone_number, :image)
  end
end