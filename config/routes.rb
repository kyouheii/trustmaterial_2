Rails.application.routes.draw do

<<<<<<< HEAD
  root 'static_pages#top'

  post '/callback' => 'linebot#callback'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'omniauth_callbacks'
  } 
=======
  





  root 'static_pages#top'

  resources :clients do
    resources :invoices
    get "/invoices/show.pdf"=>"invoices#show"
    resources :quotations
    get "/quotations/show.pdf"=>"quotations#show"
  end
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :omniauth_callbacks =>  'users/omniauth_callbacks'
  } 
  # root to: "home#index"
  
>>>>>>> ec53270ee43e5335374b55e55d124ebf7a012f62
  
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
