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


  ################################################
  # TODO "user/my-threads"
  # TODO "user/profile"
  # TODO "user/messages"

  # get "user/profile" => "usercontroller#show-my-profile", as: "show_user_profile"
  # get "user/my-threads" => "???????????????", as: "show_user_threads"
  # get "user/messages"  => "???????????", as: private_messages
  ################################################


  get   "user/messages/new-message" => 'private_message#new_message', as: 'private_messages'
  post  "user/messages/new-message" => 'private_message#send_private_message'
  get   "user/messages/:id"=> 'private_message#show', as: 'show_private_message'

  get "/impressum" => "static_pages#impressum" , as: 'impressum'

end
