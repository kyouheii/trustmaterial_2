Rails.application.routes.draw do

  

  root 'static_pages#top'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :omniauth_callbacks =>  'users/omniauth_callbacks'
  } 

  
  
  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "logout", :to => "users/sessions#destroy"
  end
end