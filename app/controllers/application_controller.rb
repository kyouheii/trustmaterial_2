class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

   # ログイン済みのユーザーか確認する。
  def logged_in_user
    unless user_signed_in?
      flash[:danger] = "ログインして下さい。"
      redirect_to root_url
    end
  end

  # 渡されたユーザーがログイン済みのユーザーであればtrueを返す。
  def current_user?(user)
    user == current_user
  end

   # current_userを@userにセット
  def set_user
    @user = current_user
  end

  # アクセスしたユーザーが現在ログインしているユーザーか確認する。
  def correct_user
    unless current_user?(@user)
      flash[:danger] = "他のユーザーは権限がありません。"
      redirect_to root_url
    end
  end

  # システム管理権限所有かどうか判定する。
  def admin_user
    unless user_signed_in? && current_user.admin?
      flash[:danger] = "権限がありません。"
      redirect_to root_url
    end
  end

  # 管理権限者、または現在ログインしているユーザーを許可する。
  def admin_or_correct_user
    # @user = User.find(params[:id]) if @user.blank?
    unless current_user?(@user) || current_user.admin?
      flash[:danger] = "権限がありません。"
      redirect_to root_url
    end
  end

  
  # このアクションを追加
  def after_sign_in_path_for(resource)
    "/user/#{current_user.id}"
  end

  protected

  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
