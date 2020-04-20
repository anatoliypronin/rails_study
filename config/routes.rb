Rails.application.routes.draw do
  root to: 'welcome#index'

  namespace :admin do
    root to: 'admin/professions#index'

    resources :professions
  end
end
