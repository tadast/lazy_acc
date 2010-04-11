ActionController::Routing::Routes.draw do |map|
  map.resources :transactions, :collection => {:update_transaction_status => :put}

  map.resources :bills

  map.resources :budgets

  map.resources :buckets
  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_session

  map.resource :tours, :collection => {:step1 => :get, :step2 => :get }
  map.root :controller => "tours", :action => "show"
end
