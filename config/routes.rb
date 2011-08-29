WebMonitor::Application.routes.draw do
  get "welcome/index"

  match ':controller(/:action(/:id(.:format)))'

  match 'update' => 'welcome#update'
  
  root :to => "welcome#index"
end
