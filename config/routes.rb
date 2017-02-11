Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :lists do
    resources :tasks do
      member do
        patch :complete
      end
    end
  end
end
