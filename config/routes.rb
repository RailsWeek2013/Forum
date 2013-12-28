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

  # Suche
  get     "search"                  => 'search#search'

  # Adminbereich
  get     "admin/index"            => 'admins#index',         as: :admins_index
  delete  "admin/destroy/:id"      => 'admins#destroy',       as: :admins_destroy
  patch   "admin/nospam/:id"       => 'admins#noSpam' ,       as: :admins_nospam
  get     "admin/new-posts"        => 'admins#new_posts',     as: :admin_new_posts
  get     "admin/spam-posts"       => 'admins#spam_post',     as: :admin_spam_posts
  get     "admin/topics-threads"   => 'admins#topics_threads',as: :admin_topics_threads
  get     "admin/users"            => 'admins#users',         as: :admin_users
  get     "admin/topics/:id/edit"  => 'admins#topic_edit',    as: :admin_edit_topic
  get     "admin/thread/:id/edit"  => 'admins#thread_edit',   as: :admin_edit_thread
  get     "admin/thread/:id/move"  => 'admins#thread_move',   as: :admin_move_thread
  patch   "admin/thread/:id/moved" => 'admins#thread_moved',  as: :admin_moved_thread

  # User
  get   "user"          => 'user#current_user_profil',          as: 'current_user'
  patch "user"          => 'user#update'
  put   "user"          => 'user#update'
  get   "user/edit"     => 'user#edit',                         as: 'edit_user'
  get   "user/threads"  => 'user#current_user_threads',         as: 'current_user_threads'
  get   "user/messages" => 'user#current_user_messages',        as: 'current_user_messages'
  get   "user/:id"      => 'user#show',                         as: 'show_user'

  # Private Nachrichten
  get   "user/messages/new-message" => 'private_message#new_message',           as: 'private_messages'
  post  "user/messages/new-message" => 'private_message#send_private_message'
  get   "user/messages/:id"         => 'private_message#show',                  as: 'show_private_message'

  # Statische Seiten
  get "/impressum" => "static_pages#impressum" , as: 'impressum'

end
