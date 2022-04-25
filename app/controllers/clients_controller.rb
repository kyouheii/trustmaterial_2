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
    if @client.save
      flash[:success] = "取引先を登録しました。" # 4/25訂正
      redirect_to clients_path
    else
      # render ("clients/new")
      flash[:danger] = "取引先の登録に失敗しました。" # 4/25訂正
      render :new # 4/25訂正
    end
  end

  #edit->編集ページの表示
  def edit
    #before_actionでデータの取得は完了している
  end

  def update
    #編集データの取得
    if @client.update!(client_params)
      #updateが完了したら一覧ページへリダイレクト
      flash[:success] = "取引先を更新しました。" # 4/25訂正
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
