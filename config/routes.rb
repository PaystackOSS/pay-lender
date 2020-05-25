# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :loan_applications, only: %i[index new create]
    resources :card_details, only: %i[index new create]
  end
  resources :loan_types
  resources :card_details, only: %i[show edit update destroy]
  root to: 'users#new'

  get '/create-card', to: 'card_details#create'
end
