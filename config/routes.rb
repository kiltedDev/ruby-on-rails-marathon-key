Rails.application.routes.draw do
  root 'homes#index'

  resources :cohorts, only: [:index, :show]
  resources :students, only: [:index]
  resources :group_projects, only: [:index, :show] do
    resources :tasks, only: [:show]
  end

end
