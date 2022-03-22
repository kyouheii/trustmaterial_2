class TusinQuotationsController < ApplicationController
  before_action :set_client
  before_action :set_tusin_quotation, only: %i(show edit update destroy)
  before_action :set_q, only: [:index, :search]

  def index
    @tusin_quotations = @client.tusin_quotations
    # @q = @client.tusin_quotations.ransack(params[:q])
    # @tusin_quotations = @q.result(distinct: true)
  end

  def show
    @tusin_quotations = @client.tusin_quotations
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'tusin_quotations',
               layout: 'pdf',
               encording: 'UTF-8',
               template: 'tusin_quotations/show',
               orientation: 'Landscape'
      end
    end
  end

  def new
    @tusin_quotation = TusinQuotation.new
  end

  def create
    @tusin_quotation = @client.tusin_quotations.new(tusin_quotation_params)
    if @tusin_quotation.save
      flash[:success] = "見積書を新規作成しました。"
      redirect_to client_tusin_quotations_url @client
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
    if @tusin_quotation.update!(tusin_quotation_params)
      #updateが完了したら一覧ページへリダイレクト
      flash[:success] = "従業員情報を更新しました。"
      redirect_to client_tusin_quotations_url @client
    else
      #updateを失敗すると編集ページへ
      render :edit 
    end
  end

  def destroy
    #データの削除
    @tusin_quotation.destroy
    flash[:success] = "#{@tusin_quotation.store}のデータを削除しました。"
    #一覧ページへリダイレクト
    redirect_to client_tusin_quotations_path(@client)
  end

  def search
    @results = @q.result
  end

  private

  def tusin_quotation_params
    params.require(:tusin_quotation).permit(:item_number, :store, :worked_date, :staff_name, :work_start_time, :work_end_time, :break_time, :division, :unit_price, :commuting_allowance, :note)
  end

  #共通処理なので、before_actionで呼び出している
  def set_tusin_quotation
    #特定データの取得
    #@quotation = Quotation.find(params[:id])
    unless @tusin_quotation = @client.tusin_quotations.find_by(id: params[:id])
      flash[:danger] = "権限がありません。"
      redirect_to client_tusin_quotations_url @client
    end
  end
  
  def set_client
    #特定データの取得
    @client = Client.find(params[:client_id])
  end

  def set_q
    @q = TusinQuotation.ransack(params[:q])
  end
end
