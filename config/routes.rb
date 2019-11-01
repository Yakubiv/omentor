Rails.application.routes.draw do
  root to: 'homes#index'

  devise_for :tutors
  namespace :tutors do
    root 'dashboads#show'

    resource :dashboard, only: :show
  end

  devise_for :students
  namespace :students do
    root 'dashboads#show'

    resource :dashboard, only: :show
  end

  constraints Subdomain do
    devise_for :admins

    namespace :admin do
      root 'dashboads#show'

      resource :dashboard, only: :show
    end
  end
end
