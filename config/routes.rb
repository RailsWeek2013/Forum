Forum::Application.routes.draw do

  
  root   'topics#index'


  devise_for :users


  resources :topics, except: [:show, :edit] do
    resources :user_threads, except: [:show, :edit] do
      resources :posts, except: [:show, :edit] do
        member do 
          patch 'mark-as-spam'  => 'posts#spam',      as: 'spam'
          patch 'rate-up'       => 'posts#rate_up',   as: 'rate_up'
          patch 'rate-down'     => 'posts#rate_down', as: 'rate_down'
        end
      end
    end
  end


  get     "search"                  => 'search#search'


  get     "admin/index"            => 'admins#index',        as: :admins_index
  delete  "admin/destroy/:id"      => 'admins#destroy',      as: :admins_destroy
  patch   "admin/nospam/:id"       => 'admins#noSpam' ,      as: :admins_nospam
  get     "admin/new-posts"        => 'admins#new_posts',    as: :admin_new_posts
  get     "admin/spam-posts"       => 'admins#spam_post',    as: :admin_spam_posts
  get     "admin/threads"          => 'admins#threads',      as: :admin_threads
  get     "admin/topics"           => 'admins#topics',       as: :admin_topics
  get     "admin/users"            => 'admins#users',        as: :admin_users
  get     "admin/topics/:id/edit"  => 'admins#topic_edit',   as: :admin_edit_topic
  get     "admin/thread/:id/edit"  => 'admins#thread_edit',  as: :admin_edit_thread
  get     "admin/thread/:id/move"  => 'admins#thread_move',  as: :admin_move_thread
  patch   "admin/thread/:id/moved" => 'admins#thread_moved',  as: :admin_moved_thread


  get   "user"          => 'user#show_current_user',  as: 'show_current_user'
  get   "user/edit"     => 'user#edit',               as: 'edit_user'
  patch "user"          => 'user#update'
  put   "user"          => 'user#update'
  get   "user/threads"  => 'user#my_threads',         as: 'show_user_threads'
  get   "user/:id"      => 'user#show',               as: 'show_user'

  get "/impressum" => "static_pages#impressum" , as: 'impressum'

  #match ':rest' => 'application#notfound', via: :all

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
