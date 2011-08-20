WebMonitor::Application.routes.draw do
  get "welcome/index"

  resources :site
  match 'update' => 'welcome#update'

  root :to => "welcome#index"

  match ':controller(/:action(/:id(.:format)))'
end
