class QuotationsController < ApplicationController
  def index
    @quotations = Quotation.all
  end

  def show
    @quotation = Quotation.find(params[:id]) #urlのところからidの番号をとってくる。
  end

  def new
    @quotation = Quotation.new
  end

  def create
    @quotation = Quotation.new(quotation_params)
    @quotation.save
    redirect_to quotation_path(@quotation)
  end

  def edit
  end

  private

  def quotation_params
    params.require(:quotation).permit(:store, :worked_date, :staff_name, :work_start_time, :work_end_time, :break_time, :division, :unit_price, :gain_cards, :gain_apps, :incentive, :commuting_allowance, :note)
  end

end
