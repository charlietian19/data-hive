Rails.application.routes.draw do
  # root "home#index"

  # TEMPORARY home view
  # root "projects#index"
  ######################
  # Projects
  ######################
  resources :projects


  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
end
