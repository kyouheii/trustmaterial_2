require 'line/bot'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :validate_signature, except: [:new, :create]
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :info, :warning, :danger

  $days_of_the_week = %w{日 月 火 水 木 金 土}
  UPDATE_ERROR_MSG = "勤怠登録に失敗しました。やり直してください。"

  # def validate_signature
  #   body = request.body.read
  #   signature = request.env['HTTP_X_LINE_SIGNATURE']
  #   unless client.validate_signature(body, signature)
  # end  

  def client
    @client ||= Line::Bot::Client.new { |config|
      # ローカルで動かすだけならベタ打ちでもOK。
      config.channel_secret = "d47efad30ff714767fdbe95d5de9559d"
      config.channel_token = "8hOhcc4BeDmJ9bNt5WwDlCtNW+atD3DBE23onzavM53ZZRppDP7fuYrZE3+46KJEb2R8NpyvnSoNlLol//50T4mv4QXxGaX2me0ejcvbdMdzOwh9g09xr65SXa3myxEh5CaTn7p8tD7UY6xEhqvW2gdB04t89/1O/w1cDnyilFU="
    }
  end

  $days_of_the_week = %w{日 月 火 水 木 金 土}
  UPDATE_ERROR_MSG = "勤怠登録に失敗しました。やり直してください。"
   # ログイン済みのユーザーか確認する。
  # def logged_in_user
  #   unless user_signed_in?
  #     flash[:danger] = "ログインして下さい。"
  #     redirect_to root_url
  #   end
  # end

  # 渡されたユーザーがログイン済みのユーザーであればtrueを返す。
  def current?(user)
    user == current_user
  end


   # current_userを@userにセット
  def set_user
    @user = current_user
  end

  # アクセスしたユーザーが現在ログインしているユーザーか確認する。
  # def correct_user
  #   unless current_user?
  #     flash[:danger] = "他のユーザーは権限がありません。"
  #     redirect_to root_url
  #   end
  # end
  # システム管理権限所有かどうか判定する。
  def admin_user
    unless user_signed_in? && current_user.admin?
      flash[:danger] = "他の権限がありません。"
      redirect_to root_url
    end
  end

  # 管理権限者、または現在ログインしているユーザーを許可する。
  # def admin_or_correct_user
  #   # @user = User.find(params[:id]) if @user.blank?
  #   unless current_user?(@user) || current_user.admin?
  #     flash[:danger] = "権限がありません。"
  #     redirect_to root_url
  #   end
  # end

  # このアクションを追加
  def after_sign_in_path_for(resource)
    new_user_session_path
  end


  def set_one_month
    @first_day = params[:date].nil? ? #nilだったらその月
    Date.current.beginning_of_month : params[:date].to_date
    @last_day = @first_day.end_of_month
    one_month = [*@first_day..@last_day] # 対象の月の日数を代入します。
    # ユーザーに紐付く一ヶ月分のレコードを検索し取得します。
    @schedules = @user.schedules.where(worked_on: @first_day..@last_day).order(:worked_on)

    unless one_month.count == @schedules.count # それぞれの件数（日数）が一致するか評価します。
      ActiveRecord::Base.transaction do # トランザクションを開始します。
        # 繰り返し処理により、1ヶ月分の勤怠データを生成します。
        one_month.each { |day| @user.schedules.create!(worked_on: day) }
    end
    @schedules = @user.schedules.where(worked_on: @first_day..@last_day).order(:worked_on)
  end
  rescue ActiveRecord::RecordInvalid # トランザクションによるエラーの分岐です。
    flash[:danger] = "ページ情報の取得に失敗しました、再アクセスしてください。"
    redirect_to root_url
  end

  def all_set_one_month
    @first_day = params[:date].nil? ? #nilだったらその月
    Date.current.beginning_of_month : params[:date].to_date
    @last_day = @first_day.end_of_month
    # 全ユーザーに紐付く一ヶ月分のレコードを検索し取得します。
    @schedules = Schedule.where(worked_on: @first_day..@last_day).order(:worked_on, :user_id).group_by(&:worked_on)
  end


  private

    def admin_return
      redirect_to root_path if current_user.admin?
    end

    def no_admin_return
      redirect_to root_path unless current_user.admin?
    end

    def no_logged_in_return
      redirect_to root_path unless user_signed_in?
    end

    def current_user_admin?
      @admin_user = current_user ? current_user.admin? : current_user
    end



  def set_one_month
    @first_day = params[:date].nil? ? #nilだったらその月
    Date.current.beginning_of_month : params[:date].to_date
    @last_day = @first_day.end_of_month
    one_month = [*@first_day..@last_day] # 対象の月の日数を代入します。
    # ユーザーに紐付く一ヶ月分のレコードを検索し取得します。
    @schedules = @user.schedules.where(worked_on: @first_day..@last_day).order(:worked_on)

    unless one_month.count == @schedules.count # それぞれの件数（日数）が一致するか評価します。
      ActiveRecord::Base.transaction do # トランザクションを開始します。
        # 繰り返し処理により、1ヶ月分の勤怠データを生成します。
        one_month.each { |day| @user.schedules.create!(worked_on: day) }
    end
    @schedules = @user.schedules.where(worked_on: @first_day..@last_day).order(:worked_on)
  end
  rescue ActiveRecord::RecordInvalid # トランザクションによるエラーの分岐です。
    flash[:danger] = "ページ情報の取得に失敗しました、再アクセスしてください。"
    redirect_to root_url
  end

  def all_set_one_month
    @first_day = params[:date].nil? ? #nilだったらその月
    Date.current.beginning_of_month : params[:date].to_date
    @last_day = @first_day.end_of_month
    # 全ユーザーに紐付く一ヶ月分のレコードを検索し取得します。
    @schedules = Schedule.where(worked_on: @first_day..@last_day).order(:worked_on, :user_id).group_by(&:worked_on)
  end


  private

    def admin_return
      redirect_to root_path if current_user.admin?
    end

    def no_admin_return
      redirect_to root_path unless current_user.admin?
    end

    def no_logged_in_return
      redirect_to root_path unless user_signed_in?
    end

    def current_user_admin?
      @admin_user = current_user ? current_user.admin? : current_user
    end


  protected

  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
