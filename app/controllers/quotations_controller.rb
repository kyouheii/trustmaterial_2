class QuotationsController < ApplicationController
  before_action :set_client
  before_action :set_quotation, only: %i(show edit update destroy)
  before_action :set_q, only: [:index, :search]

  def index
    @quotations = @client.quotations
    # @q = @client.quotations.ransack(params[:q])
    # @quotations = @q.result(distinct: true)
  end

  def show
    @quotations = @client.quotations
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'quotations',
               layout: 'pdf',
               encording: 'UTF-8',
               template: 'quotations/show',
               orientation: 'Landscape'
      end
    end
  end

  def new
    @quotation = Quotation.new
  end

  def create
    @quotation = @client.quotations.new(quotation_params)
    if @quotation.save
      flash[:success] = "見積書を新規作成しました。"
      redirect_to client_quotations_url @client
    else
      render :new
    end
  end

  #edit->編集ページの表示
  def edit
    #before_actionでデータの取得は完了している
  end

  def update
    #編集データの取得
    if @quotation.update!(quotation_params)
      #updateが完了したら一覧ページへリダイレクト
      flash[:success] = "従業員情報を更新しました。"
      redirect_to client_quotations_url @client
    else
      #updateを失敗すると編集ページへ
      render :edit 
    end
  end

  def destroy
    #データの削除
    @quotation.destroy
    flash[:success] = "#{@quotation.store}のデータを削除しました。"
    #一覧ページへリダイレクト
    redirect_to client_quotations_path(@client)
  end

  def search
    @results = @q.result
  end

  private

  def quotation_params
    params.require(:quotation).permit(:item_number, :store, :worked_date, :staff_name, :work_start_time, :work_end_time, :break_time, :division, :unit_price, :gain_cards, :gain_apps, :incentive, :commuting_allowance, :note)
  end

  #共通処理なので、before_actionで呼び出している
  def set_quotation
    #特定データの取得
    #@quotation = Quotation.find(params[:id])
    unless @quotation = @client.quotations.find_by(id: params[:id])
      flash[:danger] = "権限がありません。"
      redirect_to client_quotations_url @client
    end
  end
  
  def set_client
    #特定データの取得
    @client = Client.find(params[:client_id])
  end

  def set_q
    @q = Quotation.ransack(params[:q])
  end
end
