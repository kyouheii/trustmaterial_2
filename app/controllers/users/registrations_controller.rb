# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # プロフィール画面用のアクションを追加
  # def detail
  #   @user = User.find_by(id: params[:id])
  # end

  # protected

  # ここのコメントアウトを外してリダイレクト先を指定
  # ルートパス名でも良い
  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  # end
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   user = params[:user].permit(:name, :email, :password, :password_confirmation, :nearest_station, :phone_number)
  #   if (@user = User.find_by_email(params[:email]))
  #     flash[:success] = "User already exists."
  #     if @user.save
  #       session[:user_id] = user.id
  #       flash[:success] = "新規作成しました。"
  #       byebug
  #       redirect_to index_one_month_schedules_path(current_user)
  #     else
  #       render 'new'
  #     end
  #   end
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
    log_out
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :nearest_station, :phone_number)
  end
end
