Rails.application.routes.draw do


  get 'welcome/index'
  root 'welcome#index'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'users/', to: 'users#index'
  get 'users/:user_id', to: 'users#show', as: :profil_user



  resources :places

  # resources :users do
  #   resources :maps
  # end
  resources :maps

  delete '/map_place/delete' , to: 'map_places#destroy', as: :unlink_map_place

end
