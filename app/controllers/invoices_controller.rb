class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  def index
    @invoices = Invoice.all
  end

  def show
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.save
    redirect_to invoice_path(@invoice)
  end

  #edit->編集ページの表示
  def edit
    #before_actionでデータの取得は完了している
  end

  def update
    #編集データの取得
    if @invoice.update!(invoice_params)
      #updateが完了したら一覧ページへリダイレクト
      flash[:success] = "従業員情報を更新しました。"
      redirect_to invoices_url
    else
      #updateを失敗すると編集ページへ
      render :edit     
    end
  end

  def destroy
    #データの削除
    @invoice.destroy
    flash[:success] = "#{@invoice.due_date}のデータを削除しました。"
    #一覧ページへリダイレクト
    redirect_to invoices_url
  end

  private
  
  def invoice_params
    params.require(:invoice).permit(:sales_staff, :item, :pay_terms, :due_date, :card_labor_cost, :card_incentive, :card_labor_commuting_allowance, :cell_phone_sales_labor_cost, :cell_phone_sales_commuting_allowance, :cell_phone_sales_saninline, :subtotal_fee, :tax, :total_fee)
  end

  #共通処理なので、before_actionで呼び出している
  def set_invoice
    #特定データの取得
    @invoice = Invoice.find(params[:id])
  end
end
