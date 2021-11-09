Rails.application.routes.draw do

  root 'static_pages#top'

  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations',
    :omniauth_callbacks =>  'omniauth_callbacks'
  } 
  
  # devise_scope :users do
  # #   # get "user/:id", :to => "users/registrations#show"
  #   get "login", :to => "users/sessions#new"
  #   get "signup", :to => "users/registrations#new"
  #   get "logout", :to => "users/sessions#destroy"
  # end

  resources :users do
    member do
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

end
