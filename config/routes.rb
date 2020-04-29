Rails.application.routes.draw do
  root to: 'welcome#index'
  
  namespace :admin do
    root to: 'admins#index'
    resource :session, only: [:new, :create, :destroy]
    resources :admins, :students, :courses, :teachers do
      put 'restore'
      put 'del'
    end
    
    resources :professions, :teachers

    resources :students
    resources :courses do
      put 'restore'
      put 'del'
    end
  end
end
