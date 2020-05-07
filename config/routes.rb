Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :professions, only: [:index, :show]
    end
  end

  scope module: :web do
    root to: 'welcome#index'
    namespace :admin do
      root to: 'admins#index'
      resource :session, only: %i[new create destroy]
      resources :admins, :students, :courses, :teachers, :professions do
        put 'restore'
        put 'del'
      end
    end

    namespace :teacher do
      root to: 'welcome#index'
      resource :profile, only: %i[edit update]
      resource :session, only: %i[new create destroy]
    end
  end
end
