# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: { sessions: 'api/sessions', registrations: 'api/registrations' }
    resources :projects do
      resources :todos
      post 'todos/sorting', to: 'todos#sorting', as: 'todos_sorting'
    end
  end
end
