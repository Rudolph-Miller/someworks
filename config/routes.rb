Rails.application.routes.draw do
  namespace :publishers do
  get 'tasks', to: 'tasks#index'
  post 'tasks/create', to: 'tasks#create'
  get 'tasks/new'
	post 'tasks/delete', :controller => 'tasks', :action => 'delete'
	get 'tasks/show', to: 'tasks#show'
	patch 'tasks/update', to: 'tasks#update'
	get 'tasks/edit', :controller => 'tasks', :action => 'edit'
	delete 'tasks/delete', :controller => 'tasks', :action => 'delete'

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
	get 'tasks/show', to: 'tasks#show'
	get 'tasks/assign', to: 'tasks#assign'
	get 'new', to: 'tasks#new'
	post 'create', to: 'tasks#create'
	post 'tasks/delete', :controller => 'tasks', :action => 'delete'
	get 'tasks/edit', to: 'tasks#edit'
	patch 'tasks/update', to: 'tasks#update'
  end

end

