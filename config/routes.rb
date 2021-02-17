Rails.application.routes.draw do
  namespace :admin do
    get 'order_details/update'
  end
  namespace :admin do
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'homes/top'
  end
  get 'home/admin/homes'
  get 'home/top'
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
    resources :items
  end

  # 顧客
  scope module: :public do
    resources :items
  end

end