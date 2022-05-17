# frozen_string_literal: true

Rails.application.routes.draw do
  root 'inventories#index'
  resources :inventories
  resources :warehouses
end
