class CarfaresController < ApplicationController
  def new
    @carfare = Carfare.new
  end
  
  def create
    @carfare = Carfare.new(carfare_params)
    if @carfare.save
      flash[:success] = '経費登録完了しました。'
      render :show
    else
      render :new
    end
  end

  def show
    @carfare = Carfare.find(params[:id])
  end

  def index
  end

  def carfare_params
    params.require(:carfare).permit(:date_of_use, :password, :public_transportation_arrival, :transportation, :public_transportation_departure, :parking_fee, :public_transportation_cash, :hotel_charge, :moving_distance, :highway_rate, :transportation_image, :image)
  end
end
