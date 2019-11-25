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

      resource :dashboard, only: :show
    end
  end

  get '/students/pending', to: 'students/details#pending'
  get '/students/details', to: 'students/details#show'

  authenticated :admin do
    mount Sidekiq::Web => '/sidekiq'

    constraints Subdomain do
      devise_for :admins

      namespace :admin do
        root 'dashboards#show'

        resource :dashboard, only: :show
      end
    end
  end
end
