Rails.application.routes.draw do

  resources :orders

  resources :line_items

  resource :cart, :only => [:show, :update, :destroy]

  devise_for :users, :controllers=> { registrations: 'registrations' }

  resources :products

  resources :users

  get ':category_id', to: 'products#index', as: 'category_products'
  root 'products#index'

  get 'accountinformations/show'

  #Definition der Variable store, um bei Controllern auf diese verweisen zu können, z.B. Einkaufswagen gelöscht wird
  root to: 'products#index', as: 'store'

  post '/checkout/overview' => 'checkout#overview', as: 'checkouts_overview'
  get '/checkout/overview' => 'checkout#overview', as: 'checkout_overview'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
