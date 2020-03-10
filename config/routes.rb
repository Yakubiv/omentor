require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'homes#index'

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
      resources :subjects
    end
  end

  devise_for :users, controllers: { confirmations: 'devises/confirmations',
                                    registrations: 'devises/registrations' }

  authenticated :user do
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

      resource :profile, only: :show
      resource :details, only: %i[show create update] do
        get :photo, on: :collection
        get :bio, on: :collection
        get :video, on: :collection
        get :schedule, on: :collection
      end
      resource :dashboard, only: :show
      resources :lessons, only: %i[index show update], concerns: :lessonable
      resources :calendars, only: :index
      resources :chats, only: :index
      resources :settings, only: :index
      resources :students, only: :index
    end

    namespace :students, path: 's' do
      root 'dashboards#show'
      resource :details, only: %i[show create update] do
        get :photo, on: :collection
        get :bio, on: :collection
      end
      resource :dashboard, only: :show
      resource :profile, only: :show
      resources :chats, only: :index
      resources :lessons, only: %i[index show update], concerns: :lessonable
      resources :tutor_profiles, path: :tutors, only: :index
      resources :calendars, only: :index
      resources :my_tutors, only: :index

      namespace :lessons do
        scope ':lesson_id' do
          resource :checkout, only: %i[show create]
        end
      end

      scope module: :tutors do
        resources :tutors, only: [], path: nil, as: nil do
          resource :booking, only: %i[show create]
          resource :profile, only: :show
          resource :calendars, only: :show
        end
      end
    end
  end

  resources :users, only: [] do
    get :pending, on: :collection
    get :registration, on: :collection
  end

  resources :blogs, only: :index

  mount Sidekiq::Web => '/sidekiq'
end
