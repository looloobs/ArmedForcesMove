ActionController::Routing::Routes.draw do |map|
  map.resources :play_areas

  map.resources :play_categories

  map.resources :shopcats

  map.resources :housings

  map.resources :shop_categories

  map.resources :neighborhoods

  map.resources :schools

  
  map.resources :users 
  map.resource :session
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login  '/login',  :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'

  map.resources :roles
  map.resource :answers
  map.resource :questions
  map.resource :housings
  map.resource :offposts
  map.resource :tags
  map.resources :learns
  map.resources :eats
  map.resources :comments
  map.resources :shops
  map.resources :plays
  map.resources :shopcategories

  #map.permalink 'installation/:permalink', :controller => 'installations', :action => 'show'
  #map.connect 'installation/:permalink.:format', :controller => 'installations', :action => 'permalink', :format => nil
  
map.resources :installations do |installation| 
    installation.resources :housings
    installation.resources :housings do |housing|
      housing.resources :comments
    end
     installation.resources :neighborhoods
      installation.resources :neighborhoods do |neighborhood|
        neighborhood.resources :comments
      end
    installation.resources :schools
    installation.resources :schools do |school|
      school.resources :comments
    end
    installation.resources :eats
    installation.resources :eats do |eat|
      eat.resources :comments
    end
    installation.resources :learns
    installation.resources :learns do |learn|
      learn.resources :comments
      learn.resources :offposts
    end
    installation.resources :shops
    installation.resources :shops do |shop|
      shop.resources :comments
    end
    installation.resources :plays
    installation.resources :plays do |play|
      play.resources :comments
    end
      
    installation.resources :questions
    installation.resources :questions do |question|
      question.resources :answers
    end
    installation.resources :tags
    installation.resources :play_areas
end


 

#map.resources :installations do |installation| 
  #installation.resources :onposts
#end
  
  
  #map.resources :installations, :has_many => :onposts
  #map.resources :onposts, :has_many => :comments
  #map.resources :comments 
  #map.resources :installations, :has_many => :onposts
  #map.resources :installations, :has_many => :offposts

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.root :controller => "home" 
 # map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format' 
  map.connect ':controller/:action.:format'
  #map.installation 'installations/:permalink', :controller => 'installations', :action => 'show'
  #map.home 'installations/show/:permalink', :controller => 'home', :action => 'index'
   
  
  
  
  
end
