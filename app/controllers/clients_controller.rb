class ClientsController < ApplicationController
before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.all
    @client = Client.new
  end

  def show
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.save
    redirect_to client_path(@client)
  end

  #edit->編集ページの表示
  def edit
    #before_actionでデータの取得は完了している
  end

  def update
    #編集データの取得
    if @client.update!(client_params)
      #updateが完了したら一覧ページへリダイレクト
      flash[:success] = "従業員情報を更新しました。"
      redirect_to clients_url
    else
      #updateを失敗すると編集ページへ
      render :edit     
    end
  end
  
  def destroy
    #データの削除
    @client.destroy
    flash[:success] = "#{@client.client_name}のデータを削除しました。"
    #一覧ページへリダイレクト
    redirect_to clients_url
  end

  private

  def client_params
    params.require(:client).permit(:client_number, :client_id, :client_name, :postal_code, :address, :manager, :phone_number)
  end

  #共通処理なので、before_actionで呼び出している
  def set_client
    #特定データの取得
    @client = Client.find(params[:id])
  end
end
