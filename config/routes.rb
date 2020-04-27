Rails.application.routes.draw do
  root to: 'welcome#index'

  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    root to: 'admins#index'
    resources :admins, :students, :courses do
      put 'restore'
      put 'del'
    end
    resources :professions
    resources :teachers
  end

  namespace :teacher do
    root to: 'welcome#index'
  end
end
