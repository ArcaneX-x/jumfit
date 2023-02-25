Rails.application.routes.draw do
  root "questions#index"
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  resources :users, only: [:index, :show, :new]
  resources :questions, only: [:index, :new, :show, :create, :destroy]
end
