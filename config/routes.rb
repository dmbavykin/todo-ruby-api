# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: { sessions: 'api/sessions', registrations: 'api/registrations' }
    resources :projects do
      resources :todos do
        resources :comments
      end
      post 'todos/sorting', to: 'todos#sorting', as: 'todos_sorting'
    end
  end
end
