class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
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

  # def create
  #   @user = User.new(params[:user])
  #   if @user.save
  #     redirect_to user
  #   else
  #     flash.now[:danger] = '認証に失敗しました。'
  #     render :new
  #   end
  # end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :nearest_station, :phone_number)
  end
end

