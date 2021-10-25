Rails.application.routes.draw do
  root to: 'tasks#index'
  devise_for :users
  resources :tasks do
    resources :comments
  end
  resources :task_types
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
