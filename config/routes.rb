Forum::Application.routes.draw do

  get "search" => "search#search"
  get "search/search" 
  get "admins/index"
  delete "admins/destroy/:id" => 'admins#destroy', as: :admins_destroy
  patch "admins/nospam/:id" => 'admins#noSpam' , as: :admins_nospam
  devise_for :admins
  devise_for :users
  root 'topics#index'

  resources :topics do 
    resources :user_threads do 
      resources :posts do 
        member do 
          patch 'mark-as-spam' => 'posts#spam', as: 'spam'
        end
      end
    end
  end

  get 'user' => 'user#show_current_user', as: 'show_current_user'
  get 'user/edit' => 'user#edit', as: 'edit_user'
  patch 'user' => 'user#update'
  put 'user' => 'user#update'
  get 'user/:id' => 'user#show', as: 'show_user'

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
