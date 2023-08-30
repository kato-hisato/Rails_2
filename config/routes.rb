Rails.application.routes.draw do
 
  get 'reservations/index'
  get 'rooms/index'
  root 'top#index'
  get 'users/show'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    get 'profile_show', to: 'users/registrations#profile_show', as: 'profile_show'
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end

  resources :rooms do
    collection do
      get 'search'
    end
  end

  resources :reservations, only: [:new, :create] do
    collection do
      post :confirm
    end
  end

  resources :rooms
  resources :reservations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
