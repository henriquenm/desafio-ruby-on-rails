# frozen_string_literal: true

Rails.application.routes.draw do

  root 'welcome#index'

  resources :stores, only: [:index, :show]
  resources :transactions do
    collection do
      get :new_import
      post :import
    end
  end
end
