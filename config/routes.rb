require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'homes#index'

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
      resources :lessons, only: :index
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
      resources :tutor_profiles, path: :tutors, only: :index
      resources :calendars, only: :index
      resources :my_tutors, only: :index

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
