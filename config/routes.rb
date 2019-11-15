Rails.application.routes.draw do
  root to: 'homes#index'

  devise_for :tutors
  devise_for :students

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
