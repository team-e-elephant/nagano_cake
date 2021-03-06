Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  # 管理者
  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:new, :index,:show, :update, :edit, :create]
    resources :genres, only: [:index, :update, :edit, :create]
    resources :customers, only: [:index, :show, :update, :edit]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  # 顧客
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only: [:index, :show]
    get 'customers/my_page' => 'customers#show', as: 'my_page'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    resources :customers,  only: [:update, :edit]
    patch '/customers/:id/withdraw' => 'customers#withdraw', as: 'customers_withdraw'
    delete 'cart_items' => 'cart_items#destroy_all', as: 'cart_items_destroy_all'
    resources :cart_items, only: [:update, :index, :destroy, :create]
    post 'orders/confirm' => 'orders#confirm', as: 'orders_confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only: [:new, :index,:show, :create]
    resources :addresses, only: [:index, :update, :edit, :create, :destroy]
  end

end