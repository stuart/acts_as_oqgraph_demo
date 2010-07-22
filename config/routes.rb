ActionController::Routing::Routes.draw do |map|
  
  map.resources :oqgraph_users
  map.path_between_users 'oqgraph_users/:id/path_to/:other_id', :controller => 'oqgraph_users', :action => 'show_path'
  
  map.resources :mazes
  map.resources :cells
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
