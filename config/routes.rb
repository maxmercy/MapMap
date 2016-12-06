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
  # post  '/maps/:id/duplicate', to: 'maps#duplicate', as: :duplicate_map
  # get '/map_places/:id', to: 'map_places#show', as: :map_place_show
  # delete '/map_places/delete' , to: 'map_places#destroy', as: :unlink_map_place
  # patch  '/map_places/:id', to: 'map_places#update'

end
