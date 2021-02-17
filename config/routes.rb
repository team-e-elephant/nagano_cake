Rails.application.routes.draw do

  get 'items/index'
  get 'items/show'
  get 'items/update'
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  resources :items,only: [:index,:show,:update]

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  resources :items

end
