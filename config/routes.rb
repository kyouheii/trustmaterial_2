Rails.application.routes.draw do

  root 'static_pages#top'

  post '/callback' => 'linebot#callback'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'omniauth_callbacks'
  } 
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  


  resources :users, except: %i(show) do
    member do
      get 'go_work'
      get 'show'
    end
    resources :schedules do
      collection do
        get 'index_one_month'
        patch 'update_one_month'
        get 'all_index_one_month' # 全体のスケジュール
        patch 'all_update_one_month'
      end
    end
  end

end
