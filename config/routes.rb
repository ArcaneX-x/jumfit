Rails.application.routes.draw do
  root 'users#index'
  namespace :admin do
    resources :questions
    root to: 'questions#index'
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
