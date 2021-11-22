class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id]) #urlのところからidの番号をとってくる。
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.save
    redirect_to client_path(@client)
  end

  def edit
  end

  private

  def client_params
    params.require(:client).permit(:client_id, :client_name, :postal_code, :address, :manager, :client_number)
  end


end
