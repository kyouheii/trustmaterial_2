class SchedulesController < ApplicationController
  before_action :set_user, only: %i(index_one_month all_index_one_month)
  before_action :admin_user, only: %i(all_index_one_month)
  before_action :set_one_month, only: %i(index_one_month)
  before_action :all_set_one_month, only: %i(all_index_one_month)
  before_action :update, only: %i(update_one_month)
  UPDATE_ERROR_MSG = "勤怠登録に失敗しました。やり直してください"
  
  def all_index_one_month
    @users = User.joins(:schedules).where(schedules: {worked_on: @first_day}).order(:id) #その月の初日のレコードが存在していれば良い
  end

  def all_update_one_month
    ActiveRecord::Base.transaction do
      @user = User.find(params[:user_id])
      schedules_params.each do |id, item|
        schedule = Schedule.find(id) #全体を見ないといけないからモデルのScheduleになる。
        if item[:round_batsu].blank?
          item[:color_round_batsu] = "0"
        elsif schedule.round_batsu.present? && (schedule.round_batsu != item[:round_batsu])
          item[:color_round_batsu] = "1"
        end
        if item[:site_name].blank?
          item[:color_change_site] = "0"
        elsif schedule.site_name.present? && (schedule.site_name != item[:site_name])
          item[:color_change_site] = "1"
        end
        schedule.update_attributes!(item)
      end
      flash[:success] = "スケジュールを更新しました。"
      message = {
        type: 'text',
        text: 'スケジュールを更新しました。 確認して下さい。'
      }
      response = client.broadcast(message)
      p response
      redirect_to all_index_one_month_user_schedules_url(@user) and return
    end
  rescue ActiveRecord::RecordInvalid # トランザクションによるエラーの分岐です。
    flash[:danger] = "スケジュールを更新出来ませんでした。"
    redirect_to all_index_one_month_user_schedules_url(@user) and return
  end

  
  def index_one_month
    @user = User.find(params[:user_id])
  end

  def update_one_month
    ActiveRecord::Base.transaction do
      @user = User.find(params[:user_id])
      schedules_params.each do |id, item|
        schedule = @user.schedules.find(id) 
        if item[:round_batsu].blank?
          item[:color_round_batsu] = "0"
        elsif schedule.round_batsu.present? && (schedule.round_batsu != item[:round_batsu])
          item[:color_round_batsu] = "1"
        end
        if item[:site_name].blank?
          item[:color_change_site] = "0"
        elsif schedule.site_name.present? && (schedule.site_name != item[:site_name])
          item[:color_change_site] = "1"
        end
        schedule.update_attributes!(item)
      end
      flash[:success] = "スケジュールを更新しました。"
      message = {
        type: 'text',
        text: 'スケジュールを更新しました。 確認して下さい。'
      }
      redirect_to index_one_month_user_schedules_url(@user) and return
    end
  rescue ActiveRecord::RecordInvalid # トランザクションによるエラーの分岐です。
    flash[:danger] = "スケジュールを更新出来ませんでした。"
    redirect_to index_one_month_user_schedules_url(@user) and return
  end


  def show

  end
  
  private


  def client #lineのクライアントはlineから呼び出される
    @client = Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end


  def schedules_params
    params.require(:user).permit(schedules: [:round_batsu, :color_round_batsu, :site_name, :color_change_site])[:schedules]
  end
end