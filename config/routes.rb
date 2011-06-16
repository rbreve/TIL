Html5snippets::Application.routes.draw do
  
  resources :requests

  resources :apis
  resources :users
  resources :reports
  resources :saves
  resources :snippets do 
    collection do
      post 'sms'
    end
  end
  resources :tags
  resources :votes
  
  match '/snippets/:id/run' => 'snippets#run', :as => :run
  match '/auth/twitter/callback' => "sessions#create"
  match '/auth/facebook/callback' => "sessions#create"
  match '/signout' => "sessions#destroy", :as => :signout
  match '/voteup/:snippet_id' => "votes#voteup", :as => :voteup
  match '/snippets/sort/:sort_by' => 'snippets#index', :as => :sort
  match '/saved/:username' => 'saves#index', :as => :saved
  match '/ref/:tag' => 'apis#showbytag', :as => :ref
  match '/apis/liveedit/:keyword' => 'apis#liveedit', :as => :liveedit, :via => [:post]
  match '/login' => 'sessions#index', :as => :login
  match '/auth/failure' => "sessions#failure"
  
  match '/snippet/:id/*slugs' => "snippets#show", :as => :slug
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "snippets#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
