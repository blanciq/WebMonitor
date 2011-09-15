WebMonitor::Application.routes.draw do
  get "welcome/index"

  match 'custom_sites' => 'custom_sites#index'
  match 'custom_sites/add' => 'custom_sites#add'
  
  match ':controller(/:action(/:id(.:format)))'

  match 'update' => 'welcome#update'
  
  root :to => "welcome#index"
end
