Rails.application.routes.draw do

  get 'welcome/index'
  root 'welcome#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/', to: 'users#index'
  get 'users/:user_id', to: 'users#show', as: :profil_user

  resources :places

  resources :maps do
    member do
      post :duplicate
    end
    resources :map_places
  end

  post '/maps/:id/share', to: 'maps#map_share', as: :map_share
  get '/maps/s/:public_id', to: 'maps#show_public', as: :map_public
  post '/maps/s/:public_id', to: 'maps#save_public', as: :save_map_public
end
