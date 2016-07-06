Rails.application.routes.draw do

  get 'public/index'

  get 'public/show'

 

  # get 'admin_users/index'

  # get 'admin_users/new'

  # get 'admin_users/create'

  # get 'admin_users/edit'

  # get 'admin_users/update'

  # get 'admin_users/delete'

  # get 'admin_users/destroy'

  # get 'admin_user/index'
  # get 'access/index'

  get 'admin' , :to => "access#index"

  # get 'section/index'

  # get 'section/show'

  # get 'section/new'

  # get 'section/create'

  # get 'section/edit'

  # get 'section/update'

  # get 'section/delete'

  # get 'section/destroy'

  # get 'pages/index'

  # get 'pages/show'

  # get 'pages/new'

  # get 'pages/create'

  # get 'pages/edit'

  # get 'pages/update'

  # get 'pages/delete'

  # get 'pages/destroy'

  # get 'index/show'

  # get 'index/new'

  # get 'index/create'

  # get 'index/edit'

  # get 'index/update'

  # get 'index/delete'

  # get 'index/destroy'

  # get 'subjects/index'

  # get 'subjects/show'

  # get 'subjects/new'

  # get 'subjects/edit'

  # get 'subjects/delete'

  root 'public#index'
  get 'show/:permalink' , :to => 'public#show'
  #get 'demo/index'
  match ':controller(/:action(/:id))' , :via => [:get, :post]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
