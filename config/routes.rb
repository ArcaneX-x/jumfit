Rails.application.routes.draw do
  resources :posts
  root 'users#index'

  constraints ->(request) { request.env['warden'].user&.admin? } do
    mount Avo::Engine, at: Avo.configuration.root_path
  end

  resources :payments

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :users, only: %i[show edit update]

  resources :questions do
    resources :answers, only: %i[create destroy]
    post :show, on: :member
  end

  resources :courses do
    resources :lessons
  end
end
