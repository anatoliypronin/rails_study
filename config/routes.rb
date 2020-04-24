Rails.application.routes.draw do
  root to: 'welcome#index'

  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    root to: 'admins#index'
    resources :admins
    resources :professions
    resources :teachers
    resources :students
  end

  namespace :teacher do
    root to: 'welcome#index'
  end
end
