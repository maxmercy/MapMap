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

  # post  '/maps/:id/duplicate', to: 'maps#duplicate', as: :duplicate_map
  # get '/map_places/:id', to: 'map_places#show', as: :map_place_show
  # delete '/map_places/delete' , to: 'map_places#destroy', as: :unlink_map_place
  # patch  '/map_places/:id', to: 'map_places#update'

end
