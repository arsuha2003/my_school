Rails.application.routes.draw do
  get 'welcome/index'

  resources :grade_levels
  resources :grades
  resources :teachers
  resources :subjects
  resources :users
  resources :students
  resources :parents

  root 'welcome#index'
  root 'home#index'
end
