# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # before_action :authenticate_user!, only: [:destroy, :new]
  skip_before_action :require_no_authentication
  # GET /resource/sign_in
  def new
    @user = User.new
  end

  # POST /resource/sign_in
  def create
    if user = User.find_by(email: params[:user][:email])
      if user.valid_password?(params[:user][:password])
        sign_in user
        flash.now[:notice] = "ログインに成功しました。"
        if user.admin?
          redirect_to all_index_one_month_user_schedules_path(user)
        else
          redirect_to index_one_month_user_schedules_path(user)
        end
      else
        flash.now[:danger] = "パスワードが違います。ログインをやり直して下さい。"
        redirect_to new_user_session_path
      end
    else
      flash.now[:danger] = "メールアドレスが見つかりませんでした。ログインをやり直して下さい。"
      redirect_to new_user_session_path
    end
  end

  # def destroy
  #   # ログイン中の場合のみログアウト処理を実行します。
  #   debugger
  #   log_out if user_signed_in?
  #   flash[:success] = 'ログアウトしました。'
  #   redirect_to root_url
  # end
  # end
  
  # DELETE /resource/sign_out
  # def destroys
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
