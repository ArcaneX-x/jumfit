Rails.application.routes.draw do
  namespace :admin do
      resources :questions
      resources :profiles
      resources :payments
      resources :lessons
      resources :courses
      resources :answers
      resources :users

      root to: "questions#index"
    end
  root "users#index"
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  resources :questions do
    resources :answers, only: [:create, :destroy]
    post :show, on: :member
  end
  resources :users, only: [:show, :edit, :update, :index]
  resources :courses do
    resources :lessons
  end
end