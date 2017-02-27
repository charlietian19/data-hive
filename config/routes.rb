Rails.application.routes.draw do

  get 'uploads/new'

  get 'uploads/create'

  get 'uploads/index'

  authenticated :user do
    root to: 'projects#index', as: 'authenticated_root'
  end

  root 'home#index'
  ################
  # DEVISE
  ################
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: "users/registrations",
      passwords: "users/passwords"
  }
  resources :users do
    get 'users/dashboard', to: 'users#dashboard', as: 'dashboard'
    get 'users/profile', to: 'users#profile', as: 'profile'
    get 'edit_password', to: 'users#edit_password', as: 'edit_password'
  end

  ################
  # PROJECTS
  ################
  resources :projects do
    patch 'bookmark'
    resources :research_applications do
    end
  end

  resources :uploads

end
