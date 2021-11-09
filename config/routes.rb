Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'static_pages#top'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :omniauth_callbacks =>  'users/omniauth_callbacks'
  } 

  resources :users do
    resources :carfares do #交通費
    end
  end
  
  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "logout", :to => "users/sessions#destroy"
  end

end
