# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user_registrations' }
  resources :articles
  resources :topics
  resources :allergies
  resources :diets
  resource :user_profiles

  root to: 'articles#index'
  resources :recipes, :products
end
