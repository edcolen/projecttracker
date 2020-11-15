Rails.application.routes.draw do
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/delete_account', to: 'users#delete_account', as: 'delete_account'

  devise_for :users

  resources :projects, shallow: true do
    resources :sections, except: :index, shallow: true do
      resources :cards, except: :index, shallow: true do
        resources :comments, except: :index, shallow: true
      end
    end
  end
end
