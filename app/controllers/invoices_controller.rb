class InvoicesController < ApplicationController
  def index
  end

  def show
    @invoice = Invoice.find(params[:id]) #urlのところからidの番号をとってくる。
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.save
    redirect_to invoice_path(@invoice)
  end

  def edit
  end

  private
  
  def invoice_params
    params.require(:invoice).permit(:sales_staff, :item, :pay_terms, :due_date, :card_labor_cost, :card_incentive, :card_labor_commuting_allowance, :cell_phone_sales_labor_cost, :cell_phone_sales_commuting_allowance, :cell_phone_sales_saninline, :subtotal_fee, :tax, :total_fee)
  end
end
