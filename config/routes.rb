# frozen_string_literal: true

Rails.application.routes.draw do
  resources :user_stocks, only: %i[create destroy]
  devise_for :users
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'friends', to: 'users#friends'
  get 'search_friend', to: 'users#search'
  resources :friendships, only: %i[create destroy]
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
