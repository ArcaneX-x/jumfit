Rails.application.routes.draw do
  root "users#index"
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  resources :questions do
    resources :answers, only: [:create, :destroy]
    post :show, on: :member
  end
  resources :users, only: [:show, :edit, :update, :index]
end