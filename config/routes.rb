Rails.application.routes.draw do

  root 'static_pages#top'

  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations',
    :omniauth_callbacks =>  'omniauth_callbacks'
  } 
  
  resources :users, except: %i(show) do
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
