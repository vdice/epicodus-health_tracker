Rails.application.routes.draw do
  root 'calorie_counts#index'
  resources :calorie_counts
  resources :foods
  resources :exercises
 end
