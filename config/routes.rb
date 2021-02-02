require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'homes#index'
  get :contacts, to: 'homes#contacts'

  resources :search_tutors, only: :index
  resources :subscriptions, only: :create
  get '/sitemap.xml' => 'sitemaps#index', defaults: { format: 'xml' }

  namespace :api do
    namespace :v1 do
      resources :subjects, only: :index, format: :json
    end
  end

  constraints Subdomain do
    namespace :admin do
      root 'dashboards#show'

      resource :dashboard, only: :show
      resource :profile, only: :show

      resources :blog_posts
      resources :subjects
      resources :students, only: %i[index edit update]
      resources :tutors, only: %i[index edit update]
      resources :subscribers, only: %i[index edit update destroy]
      resources :feedbacks, only: %i[index show destroy]
    end
  end

  devise_for :users, controllers: { confirmations: 'devises/confirmations',
                                    registrations: 'devises/registrations' }

  authenticated :user do
    resources :class_rooms, only: [] do
      resources :messages, only: %i[new create]
    end

    concern :lessonable do
      get :paid, on: :collection
      get :pending, on: :collection
      get :completed, on: :collection
      get :canceled, on: :collection
    end

    resources :class_rooms, only: %i[show], param: :lesson_id

    namespace :tutors, path: 't' do
      root 'dashboards#show'

      namespace :registrations do
        resources :time_slots, except: :show
      end

      resource :profile, only: [:show, :update]
      resource :details, only: %i[show create update] do
        get :photo, on: :collection
        get :bio, on: :collection
        get :video, on: :collection
        get :schedule, on: :collection
        get :inactive, on: :collection
      end
      resource :dashboard, only: :show
      resources :lessons, only: %i[index show update], concerns: :lessonable do
        resources :attachments, only: %i[index show create update destroy new ], module: :lessons
        resources :overviews, only: %i[ index ], module: :lessons
        resources :chats, only: %i[ index ], module: :lessons
      end
      resources :calendars, only: %i[index new create edit update delete]

      scope module: :calendars do
        resource :calendars, only: [] do
          resource :lessons, only: %i[create update destroy]
        end
      end

      resources :vacations, only: %i[index new create destroy update edit]
      resources :chats, only: %i[index show]
      resources :class_rooms, only: %i[index show] do
        resources :messages
      end
      resources :settings, only: [] do
        get :photo, on: :collection
        get :bio, on: :collection
        get :video, on: :collection
        get :schedule, on: :collection
        get :account, on: :collection
        get :general, on: :collection
        get :additional, on: :collection
      end
      resources :student_profiles, only: %i[index show], path: :students

      scope module: :students do
        resources :favorites, only: :index
        resources :students, only: [], path: nil, as: nil do
          resource :favorites, only: %i[create destroy]
        end
      end
    end

    namespace :students, path: 's' do
      root 'dashboards#show'
      resource :details, only: %i[show create update] do
        get :photo, on: :collection
        get :bio, on: :collection
      end
      resource :dashboard, only: :show
      resource :profile, only: :show
      resources :chats, only: %i[index show]
      resources :lessons, only: %i[index show update], concerns: :lessonable do
        resources :overviews, only: %i[ index ], module: :lessons
        resources :chats, only: %i[ index ], module: :lessons
        resources :attachments, only: %i[index show ], module: :lessons
      end
      resources :tutor_profiles, path: :tutors, only: %i[index show]
      resources :calendars, only: :index
      resources :my_tutors, only: %i[show index]

      resource :settings, only: %i[update] do
        get :photo, on: :collection
        get :bio, on: :collection
        get :account, on: :collection
        get :general, on: :collection
      end

      namespace :lessons do
        scope ':lesson_id' do
          resource :checkout, only: %i[show create]
        end
      end

      scope module: :tutors do
        resources :favorites, only: :index
        resources :tutors, only: [], path: nil, as: nil do
          resource :booking, only: %i[show create]
          resource :profile, only: :show
          resource :calendars, only: :show
          resource :favorites, only: %i[create destroy]
        end
      end
    end
  end

  resources :users, only: [] do
    get :pending, on: :collection
  end

  namespace :tutors do
    resource :registration, only: :show
  end

  resources :blogs, only: %i[index show], path: 'blog'

  resources :feedbacks, only: :create

  mount ActionCable.server => '/cable'
  mount Sidekiq::Web => '/sidekiq'
end
