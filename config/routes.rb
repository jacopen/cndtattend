Rails.application.routes.draw do
  resources :speakers
  resources :talks, only: [:show]
  get 'timetables' => 'timetable#index'
  get 'timetables/:date' => 'timetable#index'
  get 'track/:id' => 'track#show'
  get 'dashboard/show'
  root 'home#show'
  get 'home/show'

  # Admin
  get 'admin' => 'admin#show'
  get 'admin/accesslog' => 'admin#accesslog'
  get 'admin/users' => 'admin#users'
  get 'admin/talks' => 'admin#talks'
  post 'admin/bulk_insert_talks' => 'admin#bulk_insert_talks'
  get 'admin/speakers' => 'admin#speakers'
  post 'admin/bulk_insert_speakers' => 'admin#bulk_insert_speakers'
  post 'admin/bulk_insert_talks_speaker' => 'admin#bulk_insert_talks_speaker'
  delete 'admin/destroy_user' => 'admin#destroy_user'

  # Auth
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'

  get 'dashboard' => 'dashboard#show'
  get 'logout' => 'logout#logout'
  get 'registration' => 'profiles#new'

  # Profile
  resources :profiles, only: [:new, :edit, :update, :destroy, :create]
  get 'profiles/new', to: 'profiles#new'
  post 'profiles', to: 'profiles#create'
  put 'profiles', to: 'profiles#update'
  get 'profiles', to: 'profiles#edit'
  get 'profiles/edit', to: 'profiles#edit'

  # TODO: この設定が有効だと画像が表示されないので一時的にコメントアウト
  # get '*path', controller: 'application', action: 'render_404'
  get '*path', controller: 'application', action: 'render_404'
  namespace :profiles do
    get 'talks', to: 'talks#show'
    post 'talks', to: 'talks#create'
  end
end