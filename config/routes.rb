Rails.application.routes.draw do

 
  devise_for :users
  devise_scope :user do 
    get 'admin/login', :to => "devise/sessions#new", as: :login
    get 'admin/logout', :to => "devise/sessions#destroy", as: :logout
    post "admin/add_user" =>"admin/user#create", as: :adduser
  end

   namespace :admin do
    root to: 'admin#index'
    get 'user_list', :to => 'user_list#index'
    # post 'create_user', :to => "user#create"
    get 'new_user', :to => 'user_list#new'

    get 'user_proposals', :to => 'user_proposal_forms#index'
    get 'user_appointments', :to => 'user_appointments#index'

    #BRANDS
    get 'brands', :to => 'brands#index'
    get 'new_brand', :to => 'brands#new'
    post 'create_brand', :to => 'brands#create'
    get 'edit_brand/:id', :to => 'brands#edit', as: :edit_brand
    get 'delete_brand/:id', :to => 'brands#delete', as: :delete_brand
    post 'update_brand/:id', :to => 'brands#update', as: :update_brand
    post 'destroy_brand/:id', :to => 'brands#destroy', as: :destroy_brand

    #BRAND_MAKES
    get 'brand_makes', :to => 'brand_makes#index'
    get 'new_brand_make', :to => 'brand_makes#new'
    post 'create_brand_make', :to => 'brand_makes#create'
    get 'edit_brand_make/:id', :to => 'brand_makes#edit', as: :edit_brand_make
    get 'delete_brand_make/:id', :to => 'brand_makes#delete', as: :delete_brand_make
    post 'update_brand_make/:id', :to => 'brand_makes#update', as: :update_brand_make
    post 'destroy_brand_make/:id', :to => 'brand_makes#destroy', as: :destroy_brand_make

    #Make Types
    get 'make_types', :to => 'make_types#index'
    get 'new_make_type', :to => 'make_types#new'
    post 'create_make_type', :to => 'make_types#create'
    get 'edit_make_type/:id', :to => 'make_types#edit', as: :edit_make_type
    get 'delete_make_type/:id', :to => 'make_types#delete', as: :delete_make_type
    post 'update_make_type/:id', :to => 'make_types#update', as: :update_make_type
    post 'destroy_make_type/:id', :to => 'make_types#destroy', as: :destroy_make_type
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
