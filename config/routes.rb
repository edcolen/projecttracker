Rails.application.routes.draw do
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  devise_for :users

  resources :projects, shallow: true do
    resources :sections, except: :index, shallow: true
  end
end
