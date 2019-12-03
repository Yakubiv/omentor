require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'homes#index'

  devise_for :tutors, controllers: { confirmations: 'tutors/confirmations' }
  devise_for :students, controllers: { confirmations: 'students/devise/confirmations',
                                       registrations: 'students/devise/registrations' }

  authenticated :tutor do
    namespace :tutors do
      root 'dashboards#show'

      resource :dashboard, only: :show
    end
  end

  authenticated :student do
    namespace :students do
      root 'dashboards#show'
      resources :details, only: :update
      resource :dashboard, only: :show
      resource :profile, only: :show

      resources :search_tutors, only: :index
      resources :calendars, only: :index
      resources :my_tutors, only: :index
    end
  end

  resources :blogs, only: :index

  get '/students/pending', to: 'students/details#pending'
  get '/students/details', to: 'students/details#show'

  mount Sidekiq::Web => '/sidekiq'

  authenticated :admin do
    constraints Subdomain do
      devise_for :admins

      namespace :admin do
        root 'dashboards#show'

        resource :dashboard, only: :show
      end
    end
  end
end
