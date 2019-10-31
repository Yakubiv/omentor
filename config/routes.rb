Rails.application.routes.draw do
  devise_for :students
  root to: 'homes#index'
end
