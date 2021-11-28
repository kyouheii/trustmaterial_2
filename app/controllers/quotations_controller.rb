class QuotationsController < ApplicationController
  before_action :set_quotation, only: [:show, :edit, :update, :destroy]

  def index
    @quotations = Quotation.all
  end

  def show
  end

  def new
    @quotation = Quotation.new
  end

  def create
    @quotation = Quotation.new(quotation_params)
    @quotation.save
    redirect_to quotation_path(@quotation)
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
      redirect_to quotations_url
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
    redirect_to quotations_url
  end


  private

  def quotation_params
    params.require(:quotation).permit(:store, :worked_date, :staff_name, :work_start_time, :work_end_time, :break_time, :division, :unit_price, :gain_cards, :gain_apps, :incentive, :commuting_allowance, :note)
  end

  #共通処理なので、before_actionで呼び出している
  def set_quotation
    #特定データの取得
    @quotation = Quotation.find(params[:id])
  end
  

end
