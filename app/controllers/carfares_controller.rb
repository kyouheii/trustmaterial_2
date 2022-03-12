class CarfaresController < ApplicationController
<<<<<<< HEAD
  before_action :set_user, only: [:new, :new_1, :destroy, :update, :edit, :show, :show_1, :index, :create, :update_show, :update_show_admin, :carfares_application]
  before_action :current_user, only: [:new, :new_1, :destroy, :admin_destroy_1, :update, :edit, :show, :show_1, :index, :create, :update_show, :update_show_admin]
  # before_action :correct_user, only: [:new, :new_1,:destroy, :update, :edit, :show, :show_1, :index, :update_show]
  before_action :set_q, only: [:index, :search]
  before_action :set_q_1, only: [:index_1, :search_1]
  before_action :set_q_admin, only: [:index_admin, :search_admin]
  before_action :set_q_admin_1, only: [:index_admin_1, :search_admin_1]
=======
  before_action :set_user, only: [:new, :new_1, :destroy, :update, :edit, :show, :index]
  before_action :current_user, only: [:new, :new_1, :destroy, :update, :edit, :show, :index]
  # before_action :correct_user, only: [:new, :new_1,:destroy, :update, :edit, :show, :index]
>>>>>>> 1588daeabf499aa836b3e1ca4362c36e0c0d7291

  # 交通費新規登録ページ（公共機関）
  def index
    @user = User.find(params[:user_id])
    @carfares = @user.carfares.where.not(date_of_use: nil).order(:date_of_use, :id)
    @carfares_count = @user.carfares.where.not(date_of_use: nil).where(application: '申請中', application_ok: '否認').count
    @carfares_count_A = @user.carfares.where.not(date_of_use: nil).where(application: '再申請', application_ok: '否認').count
    @carfares_count_1 = @user.carfares.where.not(date_of_use: nil).where(application: nil).count
    @carfares_count_2 = @user.carfares.where.not(date_of_use: nil).where(application_ok: nil).where(application: '申請中').count
  end

  # 交通費新規登録ページ（自家用車）
  def index_1
    @user = User.find(params[:user_id])
    @carfares = @user.carfares.where.not(date_of_use_private_car: nil).order(:date_of_use_private_car, :id)
    @carfares_count = @user.carfares.where.not(date_of_use_private_car: nil).where(application_ok_1: '否認').count
    @carfares_count_A = @user.carfares.where.not(date_of_use_private_car: nil).where(application_1: '再申請', application_ok_1: '否認').count
    @carfares_count_1 = @user.carfares.where.not(date_of_use_private_car: nil).where(application_1: nil).count
    @carfares_count_2 = @user.carfares.where.not(date_of_use_private_car: nil).where(application_ok_1: nil).where(application_1: '申請中').count
  end

  # 管理者用全ユーザー交通費一覧ページ（公共機関）
  def index_admin
    @carfares = Carfare.where.not(date_of_use: nil, application: nil).order(:date_of_use, :id)
    @carfares_count = Carfare.where.not(date_of_use: nil).where(application_ok: nil, application: '申請中').count
    @carfares_count_1 = Carfare.where.not(date_of_use: nil).where(application_ok: '否認', application: '再申請').count
  end

  # 管理者用全ユーザー交通費一覧ページ（自家用車）
  def index_admin_1
    @carfares = Carfare.where.not(date_of_use_private_car: nil, application_1: nil).order(:date_of_use_private_car, :id)
    @carfares_count = Carfare.where.not(date_of_use_private_car: nil).where(application_ok_1: nil, application_1: '申請中').count
    @carfares_count_1 = Carfare.where.not(date_of_use_private_car: nil).where(application_ok_1: '否認', application_1: '再申請').count
    @user = User.joins(:carfare).select("name").order(id: "ASC")
    @carfares = Carfare.where.not(date_of_use_private_car: nil).order(:date_of_use_private_car, :id)
  end

  # 交通費新規登録ページ（公共機関）
  def new
    @user = User.find(params[:user_id])
    @carfare = Carfare.new
  end
  
  # 交通費新規登録ページ（自家用車）
  def new_1
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.new
  end

  # 交通費詳細登録ページ（公共機関）
  def show
    @user = User.find(params[:user_id])
    @carfare = Carfare.find(params[:id])
  end
 
  # 交通費詳細登録ページ（自家用車）
  def show_1
    @user = User.find(params[:user_id])
    @carfare = Carfare.find(params[:id])
  end

  # 交通費申請（公共機関）
  def update_show
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.find(params[:id])
    # binding.pry
    if params[:carfare][:application] ==  '申請中'
      @carfare.update_attributes!(carfare_show_params)
      flash[:success] = "交通費申請（公共機関）が完了しました。"
      redirect_to user_carfares_path(@user)
    end

    if params[:carfare][:application] ==  '再申請'
      @carfare.update_attributes!(carfare_show_params)
      flash[:success] = "【再申請】交通費申請（公共機関）が完了しました。"
      redirect_to user_carfares_path(@user)
    end
    
    if params[:carfare][:application].blank?
      flash[:warning] = "必須箇所が空欄です。"
      redirect_to user_carfare_path(@user)
    end
  end

  # 交通費申請（自家用車）
  def update_show_1
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.find(params[:id])
    # binding.pry
    if params[:carfare][:application_1] ==  '申請中'
      @carfare.update_attributes!(carfare_show_params_1)
      flash[:success] = "交通費申請（自家用車）が完了しました。"
      redirect_to index_1_user_carfares_path(@user)
    end

    if params[:carfare][:application_1] ==  '再申請'
      @carfare.update_attributes!(carfare_show_params_1)
      flash[:success] = "【再申請】交通費申請（自家用車）が完了しました。"
      redirect_to index_1_user_carfares_path(@user)
    end
    
    if params[:carfare][:application_1].blank?
      flash[:warning] = "必須箇所が空欄です。"
      redirect_to index_1_user_carfares_path(@user)
    end
  end

  # 交通費申請承認（公共機関）
  def update_show_admin
    # binding.pry
    @carfare = Carfare.find(params[:id])
    @carfares = Carfare.where.not(date_of_use: nil)
    if params[:carfare][:application_ok] == "承認"
      @carfare.update_attributes!(carfare_admin_params)
      flash[:success] = "#{@carfare.user.name}の#{@carfare.date_of_use}の交通費申請（公共機関）を承認致しました"
      redirect_to index_admin_user_carfares_path(current_user) and return
    elsif params[:carfare][:application_ok] == "否認" && params[:carfare][:note].blank?
      flash[:danger] = "#{@carfare.user.name}の#{@carfare.date_of_use}の否認理由をご記入ください。"
      redirect_to index_admin_user_carfares_path(current_user) and return
    elsif params[:carfare][:application_ok] == "再否認" && params[:carfare][:note].blank?
      flash[:danger] = "#{@carfare.user.name}の#{@carfare.date_of_use}の否認理由をご記入ください。"
      redirect_to index_admin_user_carfares_path(current_user) and return
    elsif params[:carfare][:application_ok] == "否認" && params[:carfare][:note].present?
      @carfare.update_attributes!(carfare_admin_params)
      flash[:warning] = "#{@carfare.user.name}の#{@carfare.date_of_use}の交通費申請（公共機関）を否認致しました"
      redirect_to index_admin_user_carfares_path(current_user) and return
    elsif params[:carfare][:application_ok] == "再否認" && params[:carfare][:note].present?
      @carfare.update_attributes!(carfare_admin_params)
      flash[:warning] = "#{@carfare.user.name}の#{@carfare.date_of_use}の交通費申請（公共機関）を再否認致しました"
      redirect_to index_admin_user_carfares_path(current_user) and return
    elsif params[:carfare][:application_ok] == ""
      flash[:danger] = "承認又は否認を選択して下さい。"
      redirect_to index_admin_user_carfares_path(current_user) and return
    end
  end

  # 交通費申請承認（自家用車）
  def update_show_admin_1
    # binding.pry
    @carfare = Carfare.find(params[:id])
    @carfares = Carfare.where.not(date_of_use_private_car: nil)
    if params[:carfare][:application_ok_1] == "承認"
      @carfare.update_attributes!(carfare_admin_params_1)
      flash[:success] = "#{@carfare.user.name}の#{@carfare.date_of_use_private_car}の交通費申請（私有車）を承認致しました"
      redirect_to index_admin_1_user_carfares_path(current_user) and return
    elsif params[:carfare][:application_ok_1] == "否認" && params[:carfare][:note_1].blank?
      flash[:danger] = "#{@carfare.user.name}の#{@carfare.date_of_use_private_car}の否認理由をご記入ください。"
      redirect_to index_admin_1_user_carfares_path(current_user) and return
    elsif params[:carfare][:application_ok_1] == "再否認" && params[:carfare][:note_1].blank?
      flash[:danger] = "#{@carfare.user.name}の#{@carfare.date_of_use_private_car}の否認理由をご記入ください。"
      redirect_to index_admin_1_user_carfares_path(current_user) and return
    elsif params[:carfare][:application_ok_1] == "否認" && params[:carfare][:note_1].present?
      @carfare.update_attributes!(carfare_admin_params_1)
      flash[:warning] = "#{@carfare.user.name}の#{@carfare.date_of_use_private_car}の交通費申請（私有車）を否認致しました"
      redirect_to index_admin_1_user_carfares_path(current_user) and return
    elsif params[:carfare][:application_ok_1] == "再否認" && params[:carfare][:note_1].present?
      @carfare.update_attributes!(carfare_admin_params_1)
      flash[:warning] = "#{@carfare.user.name}の#{@carfare.date_of_use_private_car}の交通費申請（私有車）を再否認致しました"
      redirect_to index_admin_1_user_carfares_path(current_user) and return
    elsif params[:carfare][:application_ok_1] == ""
      flash[:danger] = "承認又は否認を選択して下さい。"
      redirect_to index_admin_1_user_carfares_path(current_user) and return
    end
  end

  # 交通費新規登録ページ（公共機関）
  def create
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.new(carfare_params)
    if @carfare.save!
      flash[:info] = '経費登録完了しました。'
      # redirect_toでcarfareの一覧ページに飛ばす
      redirect_to user_carfares_path(@user)
    else
      render :new
    end
  end

  # 交通費新規登録ページ（自家用車）
  def create_1
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.new(carfare_private_car_params)
    if @carfare.save
      flash[:info] = "経費登録が完了しました。"
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
      flash[:warning] = '交通費を削除しました。'
      redirect_to user_carfares_path(@user)
    else
      redirect_to :index
    end
  end

  # 全ユーザーの一覧画面の削除機能（自家用車）
  def destroy_1
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.find(params[:id])
    if @carfare.destroy
      flash[:warning] = '交通費を削除しました。'
      redirect_to index_1_user_carfares_path(@user)
    else
      redirect_to :index
    end
  end
  
  # 全ユーザーの一覧画面の削除機能（公共機関）
  def admin_destroy
    @user = User.find(params[:user_id])
    @carfare = Carfare.find(params[:id])
    if @carfare.destroy
      flash[:warning] = '交通費を削除しました。'
      redirect_to index_admin_user_carfares_path(current_user)
    else
      redirect_to :index_admin
    end
  end

  # 全ユーザーの一覧画面の削除機能（自家用車用）
  def admin_destroy_1
    @user = User.find(params[:user_id])
    @carfare = Carfare.find(params[:id])
    if @carfare.destroy
      flash[:warning] = '交通費を削除しました。'
      redirect_to index_admin_1_user_carfares_path(current_user)
    else
      redirect_to :index_admin_1
    end
  end

  # 全ユーザーの一覧画面の否認時削除機能（公共機関）
  def destroy_show_admin
    @carfare = Carfare.find(params[:id])
    if params[:carfare][:application_ok] == "否認" 
        @carfare.destroy
        flash[:warning] = '交通費申請を否認しました。'
        redirect_to user_carfare_path(current_user, @carfare)
    end
  end

  # 全ユーザーの一覧画面の編集機能（公共機関）
  def edit
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.find(params[:id])
  end

  # 交通費新規登録ページ（自家用車）
  def edit_1
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.find(params[:id])
  end

  def admin_edit
    @user = User.find(params[:user_id])
    @carfare = Carfares.find(params[:id])
  end

  # 交通費編集ページ（公共機関）
  def update
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.find(params[:id])
    if @carfare.update(carfare_params)
      flash[:info] = '交通費を編集致しました。'
      redirect_to user_carfares_path(@user)
    else
      render :edit
    end
  end

  # 交通費編集ページ（自家用車）
  def update_1
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.find(params[:id])
    if @carfare.update(carfare_private_car_params)
      flash[:info] = '交通費を編集致しました。'
      redirect_to index_1_user_carfares_path(@user)
    else
      render :edit
    end
  end
  
  # 交通費申請
  def update_2
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.find(params[:id])
    if @carfare.update(carfare_private_car_params)
      flash[:info] = '交通費を申請致しました。'
      redirect_to index_1_user_carfares_path(@user)
    else
      render :edit
    end
  end

  # 交通費検索ページ（公共機関）
  def search
    @results = @q.result(distinct: false).where.not(date_of_use: nil).order(:date_of_use, :id)
    @carfares_count = @user.carfares.where.not(date_of_use: nil).where(application: '申請中', application_ok: '否認').count
    @carfares_count_A = @user.carfares.where.not(date_of_use: nil).where(application: '再申請', application_ok: '否認').count
    @carfares_count_1 = @user.carfares.where.not(date_of_use: nil).where(application: nil).count
    @carfares_count_2 = @user.carfares.where.not(date_of_use: nil).where(application_ok: nil).where(application: '申請中').count
  end

  # 交通費検索ページ（自家用車）
  def search_1
    @results = @q.result.where.not(date_of_use_private_car: nil).order(:date_of_use_private_car, :id)
    @carfares_count = Carfare.where.not(date_of_use_private_car: nil).where(application_ok_1: nil, application_1: '申請中').count
    @carfares_count_1 = Carfare.where.not(date_of_use_private_car: nil).where(application_ok_1: '否認', application_1: '再申請').count
  end

  # 全ユーザーの交通費検索ページ（公共機関）
  def search_admin
    @results = @q.result.where.not(date_of_use: nil).order(:date_of_use, :id)
    @carfares_count = Carfare.where.not(date_of_use: nil).where(application_ok: nil, application: '申請中').count
    @carfares_count_1 = Carfare.where.not(date_of_use: nil).where(application_ok: '否認', application: '再申請').count
  end

  # 全ユーザーの交通費検索ページ（自家用車）
  def search_admin_1
    @results = @q.result.where.not(date_of_use_private_car: nil).order(:date_of_use_private_car, :id)
    @carfares_count = Carfare.where.not(date_of_use_private_car: nil).where(application_ok_1: nil, application_1: '申請中').count
    @carfares_count_1 = Carfare.where.not(date_of_use_private_car: nil).where(application_ok_1: '否認', application_1: '再申請').count
  end
  
  # 交通費検索詳細ページ（公共機関）
  def search_show
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.find(params[:id])
  end

  # 検索した交通費申請（公共機関）
  def update_search_show
    @user = User.find(params[:user_id])
    @carfare = @user.carfares.find(params[:id])
    # binding.pry
    if params[:carfare][:application] ==  '申請中'
      @carfare.update_attributes!(carfare_show_params)
      flash[:success] = "交通費申請（公共機関）が完了しました。"
      redirect_to search_user_carfares_path(@user)
    end

    if params[:carfare][:application] ==  '再申請'
      @carfare.update_attributes!(carfare_show_params)
      flash[:success] = "【再申請】交通費申請（公共機関）が完了しました。"
      redirect_to search_user_carfares_path(@user)
    end
    
    if params[:carfare][:application].blank?
      flash[:warning] = "必須箇所が空欄です。"
      redirect_to search_user_carfares_path(@user)
    end
  end

  private

  # 交通費新規登録ページ（公共機関）
  def carfare_params
    params.require(:carfare).permit(:date_of_use, :commuting_place, :point_of_departure, :public_transportation_arrival, :public_institution , :public_transportation_departure, :parking_fee, :public_transportation_cash, :hotel_charge, :moving_distance, :highway_rate, :image, :application)
  end

  # 交通費新規登録ページ（自家用車）
  def carfare_private_car_params
    params.require(:carfare).permit(:date_of_use_private_car, :commuting_place_private_car, :point_of_departure_private_car, :arrival_private_car, :parking_name_private_car, :moving_distance_private_car, :public_institution_private_car, :public_transportation_departure_private_car, :parking_fee_private_car, :public_transportation_cash_private_car, :hotel_charge_private_car, :highway_rate_private_car, :image_private_car)
  end
 
  #  交通費申請画面（公共機関）
  def carfare_show_params
    params.require(:carfare).permit(:name, :date_of_use, :commuting_place, :point_of_departure, :public_transportation_arrival, :public_institution , :public_transportation_departure, :parking_fee, :public_transportation_cash, :hotel_charge, :moving_distance, :highway_rate, :image, :application, :application)
  end

  #  交通費申請画面（自家用車）
  def carfare_show_params_1
    params.require(:carfare).permit(:date_of_use_private_car, :commuting_place_private_car, :point_of_departure_private_car, :arrival_private_car, :parking_name_private_car, :moving_distance_private_car, :public_institution_private_car, :public_transportation_departure_private_car, :parking_fee_private_car, :public_transportation_cash_private_car, :hotel_charge_private_car, :highway_rate_private_car, :image_private_car, :application_1, :note )
  end

  #  交通費申請承認（公共機関）
  def carfare_admin_params
    params.require(:carfare).permit(:date_of_use, :commuting_place, :point_of_departure, :public_transportation_arrival, :public_institution , :public_transportation_departure, :parking_fee, :public_transportation_cash, :hotel_charge, :moving_distance, :highway_rate, :image, :application, :application_ok, :note)
  end
  #  交通費申請承認（自家用車）
  def carfare_admin_params_1
    params.require(:carfare).permit(:date_of_use_private_car, :commuting_place_private_car, :point_of_departure_private_car, :arrival_private_car, :parking_name_private_car, :moving_distance_private_car, :public_institution_private_car, :public_transportation_departure_private_car, :parking_fee_private_car, :public_transportation_cash_private_car, :hotel_charge_private_car, :highway_rate_private_car, :image_private_car, :application_ok_1, :note_1 )
  end
  # 交通費検索ページ（公共機関）
  def set_q
    @user = User.find(params[:user_id])
    @q = @user.carfares.ransack(params[:q])
  end
  # 交通費検索ページ（自家用車）
  def set_q_1
    @user = User.find(params[:user_id])
    @q = @user.carfares.ransack(params[:q])
  end

  # 全ユーザーの一覧画面の編集機能（公共機関）
  def set_q_admin
    @q = Carfare.ransack(params[:q])
  end

  # 全ユーザーの一覧画面の編集機能（自家用車）
  def set_q_admin_1
    @q = Carfare.ransack(params[:q])
  end
end
