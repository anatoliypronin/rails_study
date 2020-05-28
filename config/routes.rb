Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :professions, only: [:index, :show]
    end
  end

  scope module: :web do
    root to: "welcome#index"
    resources :articles, :professions, only: %i[index show]
    resources :reviews, only: %i[index]
    
    namespace :admin do
      root to: "admins#index"
      resource :profile, only: %i[edit update]
      resource :session, only: %i[new create destroy]
      resources :admins, :students, :courses, :teachers, :professions, :lessons do
        put 'restore'
        put 'del'
      end
      resources :articles do
        put 'publish'
        put 'unpublish'
      end
    end

    namespace :teacher do
      root to: "welcome#index"
      resource :profile, only: %i[edit update]
      resource :session, only: %i[new create destroy]
      resources :courses, only: %i[index new create show edit update] do
        scope module: :courses do
          resources :lessons, only: %i[new create]
        end
      end

      resources :lessons do
        put 'restore'
        put 'del'
      end

      resources :articles do
        put "publish"
        put "unpublish"
      end

      resources :student_homeworks do
        put 'check'
        put 'modify'
        put 'adopted'
      end
    end

    namespace :student do
      root to: 'welcome#index'
      resource :profile, only: %i[edit update show] do
        put "delete_photo"
      end
      resource :session, only: %i[new create destroy]
      resources :student_courses, only: %i[create destroy]
      resources :courses, only: %i[index show] do
        scope module: :courses do
          resources :lessons, only: %i[show]
        end
      end
      #resources :student_homeworks, only: %i[index show edit update]
      #resources :reviews, only: %i[index new create show]
    end
  end
end
