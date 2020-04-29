Rails.application.routes.draw do
  root to: 'welcome#index'

  namespace :admin do
    root to: 'admins#index'
    resource :session, only: %i[new create destroy]
    resources :admins, :students, :courses, :teachers, :courses do
      put 'restore'
      put 'del'
    end

    resources :professions, :teachers

    resources :students
  end

  namespace :teacher do
    root to: 'welcome#index'
    resource :session, only: %i[new create destroy]
  end
end
