# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"
  resources :customers, path: 'clientes'
  
  devise_for :users
  
  namespace :main, path: '', path_names: { new: 'novo', create: 'novo', edit: 'editar', update: 'editar' } do
  end
end
