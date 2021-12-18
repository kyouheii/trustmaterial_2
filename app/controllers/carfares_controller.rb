class CarfaresController < ApplicationController
  before_action :set_user, only: [:new, :destroy, :update, :edit, :show, :index]
  before_action :current_user, only: [:new, :new_1, :destroy, :update, :edit, :show, :index]
  before_action :correct_user, only: [:new, :new_1,:destroy, :update, :edit, :show, :index]

  # 交通費新規登録ページ（公共機関）
  def index
    @user = User.find(params[:user_id])
    @carfares = @user.carfares.where.not(date_of_use: nil).order(:date_of_use, :id).paginate(page: params[:page], per_page: 2)
  end

  # 交通費新規登録ページ（自家用車）
  def index_1
    @user = User.find(params[:user_id])
    @carfares = @user.carfares.where.not(date_of_use_private_car: nil).order(:date_of_use_private_car, :id).paginate(page: params[:page], per_page: 2)
    @carfares_list = @user.carfares.where(date_of_use_private_car: params[:date_of_use_private_car], name: params[:name])
  end

  # 管理者用全ユーザー交通費新規登録ページ（公共機関）
  def index_admin
    @user = User.find(params[:user_id])
    @users =  User.all
    @carfares = Carfare.where.not(date_of_use: nil).order(:date_of_use, :id).paginate(page: params[:page], per_page: 2)
  end

  # 管理者用全ユーザー交通費新規登録ページ（自家用車）
  def index_admin_1
    @user = User.find(params[:user_id])
    @users =  User.all
    @carfares = Carfare.where.not(date_of_use_private_car: nil).order(:date_of_use_private_car, :id).paginate(page: params[:page], per_page: 2)
  end

  # 交通費新規登録ページ（公共機関）
  def new
    @user = User.find(params[:user_id])
    @carfare = Carfare.new
  end
  
  # 交通費新規登録ページ（自家用車）
  def new_1
    @user = User.find(params[:user_id])
    @carfare = Carfare.new
  end

  # 交通費新規登録ページ（公共機関）
  def create
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.new(carfare_params)
    if @carfare.save
      flash[:success] = '経費登録完了しました。'
      # redirect_toでcarfareの一覧ページに飛ばす
      redirect_to user_carfares_path(@user), notice:"経費登録完了しました。"
    else
      render :new
    end
  end

  # 交通費新規登録ページ（自家用車）
  def create_1
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.new(carfare_private_car_params)
    if @carfare.save
      flash[:success] = "登録が完了しました。"
      # redirect_toでcarfareの一覧ページに飛ばす
      redirect_to index_1_user_carfares_path(@user)
    else
      render :new
    end
  end

  # 交通費新規登録ページ（公共機関）
  def destroy
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.find(params[:id])
    if @carfare.destroy
      flash[:success] = '交通費編集完了しました。'
      redirect_to user_carfares_path(@user)
    else
      redirect_to :index
    end
  end

  def admin_destroy
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.find(params[:id])
    if @carfare.destroy
      flash[:success] = '交通費編集完了しました。'
      redirect_to user_carfares_path(@user)
    else
      redirect_to :index_admin
    end
  end

  def admin_destroy_1
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.find(params[:id])
    if @carfare.destroy
      flash[:success] = '交通費編集完了しました。'
      redirect_to user_carfares_path(@user)
    else
      redirect_to :index_admin_1
    end
  end

  # 交通費新規登録ページ（自家用車）
  def destroy_1
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.find(params[:id])
    if @carfare.destroy
      flash[:success] = '交通費編集完了しました。'
      redirect_to index_1_user_carfares_path(@user)
    else
      redirect_to :index
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @carfare = Carfare.find(params[:id])
  end

  # 交通費新規登録ページ（自家用車）
  def edit_1
    @user = User.find(params[:user_id])
    @carfare = Carfare.find(params[:id])
  end

  # 交通費新規登録ページ（公共機関）
  def update
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.find(params[:id])
    if @carfare.update(carfare_params)
      flash[:success] = '交通費編集完了しました。'
      redirect_to user_carfares_path(@user)
    else
      render :edit
    end
  end

  # 交通費新規登録ページ（自家用車）
  def update_1
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.find(params[:id])
    if @carfare.update(carfare_private_car_params)
      flash[:success] = '交通費編集完了しました。'
      redirect_to index_1_user_carfares_path(@user)
    else
      render :edit
    end
  end

  private

  # 交通費新規登録ページ（公共機関）
  def carfare_params
    params.require(:carfare).permit(:date_of_use, :public_transportation_arrival, :public_institution , :public_transportation_departure, :parking_fee, :public_transportation_cash, :hotel_charge, :moving_distance, :highway_rate, :image)
  end

  # 交通費新規登録ページ（自家用車）
  def carfare_private_car_params
    params.require(:carfare).permit(:date_of_use_private_car, :commuting_place_private_car, :arrival_private_car, :parking_name_private_car, :moving_distance_private_car, :public_institution_private_car, :public_transportation_departure_private_car, :parking_fee_private_car, :public_transportation_cash_private_car, :hotel_charge_private_car, :highway_rate_private_car, :image_private_car)
  end
end
