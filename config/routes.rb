Rails.application.routes.draw do

 
  devise_for :users
  devise_scope :user do 
    #get 'admin/login', :to => "devise/sessions#new", as: :login
    get 'admin/logout', :to => "devise/sessions#destroy", as: :logout
    post "admin/add_user" =>"admin/user#create", as: :adduser
  end

   namespace :admin do
    root to: 'admin#index'
    get 'login', :to => 'admin#login', as: :login
    get 'user_list', :to => 'user_list#index'
  
    get 'new_user', :to => 'user_list#new'

    get 'user_proposals', :to => 'user_proposal_forms#index'
    get 'user_appointments', :to => 'user_appointments#index'

    #Brands
    resources :brands, only: [:index, :new, :create, :edit, :update, :destroy]
    get 'delete_brand/:id', :to => 'brands#delete', as: :delete_brand

    #Brand Makes
    resources :brand_makes, only: [:index, :new, :create, :edit, :update, :destroy]
    get 'delete_brand_make/:id', :to => 'brand_makes#delete', as: :delete_brand_make

    #Make Types
    resources :make_types, only: [:index, :new, :create, :edit, :update, :destroy]
    get 'delete_make_type/:id', :to => 'make_types#delete', as: :delete_make_type
    
  end

  # devise_for :users, controllers: { sessions: "users/sessions" }
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
