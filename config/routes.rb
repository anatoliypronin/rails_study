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
      root to: 'admins#index'
      resource :session, only: %i[new create destroy]
      resources :admins, :students, :courses, :teachers, :professions do
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
    end
  end
end
