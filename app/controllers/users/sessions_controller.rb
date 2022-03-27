# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def line; basic_action end
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
  # ログイン中の場合のみログアウト処理を実行します。
  #   # log_out if user_signed_in?
  #   # flash.now[:success] = 'ログアウトしました。'
  #   super
  #   # redirect_to root_url
  # end

  private

  def basic_action
    @omniauth = request.env["omniauth.auth"]
    if @omniauth.present?
      @profile = User.find_or_initialize_by(provider: @omniauth["provider"], uid: @omniauth["uid"])
      if @profile.email.blank?
        email = @omniauth["info"]["email"] ? @omniauth["info"]["email"] : "#{@omniauth["uid"]}-#{@omniauth["provider"]}@example.com"
        @profile = current_user || User.create!(provider: @omniauth["provider"], uid: @omniauth["uid"], email: email, name: @omniauth["info"]["name"], password: Devise.friendly_token[0, 20])
      end
      @profile.set_values(@omniauth)
      sign_in(:user, @profile)
    end
    # flash[:notice] = "ログインしました"
    redirect_to root_path, notice: 'ログインしました。'
  end

  def fake_email(uid, provider)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end