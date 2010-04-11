ActionController::Routing::Routes.draw do |map|
  map.resources :transactions

  map.resources :bills

  map.resources :budgets

  map.resources :buckets
  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
  map.resource :tours, :collection => {:step1 => :get, :step2 => :get }
end
