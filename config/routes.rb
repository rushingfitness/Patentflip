MydeaSample::Application.routes.draw do

resources :users do 
    resources :messengers  do
      get :autocomplete_user_name, on: :collection
      collection do
        post :delete_selected
      end
    end
    member do
      get :following, :followers
    end
end

resources :search_suggestions
resources :auctions, path: "patents"
resources :sessions, only: [:new, :create, :destroy]
resources :microposts, only: [:create, :destroy]
resources :relationships, only: [:create, :destroy]
resources :convers, only: [:create, :destroy]
resources :searches, path: "search" do
      get :autocomplete_user_and_patent_search, on: :collection
end
resources :filings, path: "jobs" do
  resources :milestones
end

root to: 'static_pages#home'
match '/help', to: 'static_pages#help'
match '/about', to: 'static_pages#about'
match '/contact', to: 'static_pages#contact'
match '/faq', to: 'static_pages#faq'
match '/signup', to: 'users#new'
match '/signin', to: 'sessions#new'
match '/signout', to: 'sessions#destroy', only: :delete
match '/lawyers', to: 'users#lawyers'
match '/users/:user_id/patents', to: 'auctions#patents'
match '/search', to: 'search_suggestions#index'
match '/categories/:cat_search', to: 'auctions#categories'
match "/users/:id/hire_:id", to: 'groups#hire_you', as: "hire_you"
match "/filings/:id/hire_me", to: 'groups#hire_me', as: "hire_me"
match "/filings/:id/hire_for_job", to: 'filings#hire_for_job', as: "hire_for_job"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
