TestApp::Application.routes.draw do
  resources :emoneyouts

  resources :applications
  resources :addresses
  resources :emoneyoutstandings

  resources :clearingouts
  resources :transactions
  resources :partyrelationships
  resources :accounts
  resources :parties
  resources :people

  get "pages/home"

  get "pages/controlpanel"

  resources :rights
  resources :useraccountrights
  resources :useraccounts
  
  match 'rightassignment', :to => 'useraccountrights#rightassignment'
  match 'rightassignment/assign', :to => 'useraccountrights#assign', :as => "right_assign"
  match 'rightassignment/revoke', :to => 'useraccountrights#revoke', :as => "right_revoke"
  
  match 'relationshipassignment', :to => 'partyrelationships#relationshipassignment'
  match 'relationshipassignment/assignpossession', :to => 'partyrelationships#assignpossession', :as => "assign_possession"
  match 'relationshipassignment/possessionrevoke', :to => 'partyrelationships#possessionrevoke', :as => "possession_revoke"
  
  match 'people/new', :to => 'people#new'    # because people#new is also called from a form_tag included in a view template
  
  root :to => "pages#controlpanel"
  
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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
