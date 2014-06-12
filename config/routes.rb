Rails.application.routes.draw do
  namespace :publishers do
  get 'tasks', to: 'tasks#index'
  post 'tasks/create', to: 'tasks#create'
  get 'tasks/new'
  get 'tasks/delete'
	get 'tasks/show', to: 'tasks#show'

  get 'websites', to: 'websites#index'
  end

  namespace :writers do
  get 'articles', to: 'articles#index'
  get 'articles/new'
  post 'articles/create'
  get 'articles/delete'
	get 'articles/edit'
	get 'articles/edit'
	post 'articles/update'

  get 'assigned_tasks', to: 'assigned_tasks#index'
  end

  namespace :editors do
  get 'assigned_tasks', to: 'assigned_tasks#index'
  get 'tasks', to: 'tasks#index'
  end

	resources :tasks


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
