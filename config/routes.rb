Rails.application.routes.draw do
  namespace :publishers do
  get 'tasks', to: 'tasks#index'
  post 'tasks/create', to: 'tasks#create'
  get 'tasks/new'
	get 'tasks/show', to: 'tasks#show'
	patch 'tasks/update', to: 'tasks#update'
	get 'tasks/edit', to: 'tasks#edit'
	post 'tasks/delete', to: 'tasks#delete'
	post 'tasks/publish', to: 'tasks#publish'
	post 'tasks/unpublish', to: 'tasks#unpublish'

  get 'websites', to: 'websites#index'
  end

  namespace :writers do
  get 'articles', to: 'articles#index'
  get 'articles/new', to: 'articles#new'
	post 'articles/create', to: 'articles#create'
	get 'articles/show', to: 'articles#show'
	patch 'articles/update', to: 'articles#update'
	get 'articles/edit'
	post 'articles/update'
	post 'articles/delete', :controller => 'articles', :action => 'delete'

  get 'assigned_tasks', to: 'assigned_tasks#index'
	get 'assigned_tasks/show', to: 'assigned_tasks#show'
  end

  namespace :editors do
  get 'tasks', to: 'tasks#index'
	get 'tasks/show', to: 'tasks#show'
	post 'tasks/assign', to: 'tasks#assign'
	post 'tasks/unassign', :controller => 'tasks', :action => 'unassign'
	get 'tasks/new', to: 'tasks#new'
	post 'create', to: 'tasks#create'
	post 'tasks/delete', :controller => 'tasks', :action => 'delete'
	get 'tasks/edit', to: 'tasks#edit'
	patch 'tasks/update', to: 'tasks#update'

  get 'assigned_tasks', to: 'assigned_tasks#index'
	post 'assigned_tasks/unassign', :controller => 'assigned_tasks', :action => 'unassign'
  end

end

