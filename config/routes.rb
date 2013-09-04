Merchant::Application.routes.draw do
  
  resources :orders
  resources :order_items
  resources :products

  match '/auth/:provider/callback', to: 'sessions#create', via: :get
  match '/login' => redirect('/auth/twitter'), as: :login, via: :get
  match '/logout' => 'sessions#destroy', as: :logout, via: :get

  root to: 'products#index'

end
