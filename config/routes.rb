# frozen_string_literal: true

Rails.application.routes.draw do
  get 'comments/create'
  devise_for :users
  root 'prefectures#index'
  resources :prefectures, only: :index do
    resources :recruitments, only: %i[index new create show edit update destroy] do
      resources :comments, only: :create
    end
  end
  resources :users, only: %i[show edit update]
end
