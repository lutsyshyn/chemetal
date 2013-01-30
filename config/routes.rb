Chemetal::Application.routes.draw do

  devise_for :users
  resources :users

  root :to => "journals#index"

  resources :journals, shallow: true do
    get 'publish_toggle', on: :member
    get 'visible_toggle', on: :member
    resources :articles do
      member do
        match 'images/:filename', to: 'articles#images'
        get 'full_pdf'
        get 'get_file'
      end
      resource :abstract
    end
  end



  match '/sign', to: 'static_pages#sign_in'


  match '/home', to: 'static_pages#home'
  match '/about', to: 'static_pages#about'
  match '/guidelines', to: 'static_pages#guidelines'
  match '/papers', to: 'articles#in_preparation'
  match '/submit', to: 'articles#new'


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
