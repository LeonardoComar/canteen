# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"
  
  devise_for :users

  namespace :main, path: '', path_names: { new: 'novo', create: 'novo', edit: 'editar', update: 'editar' } do
    resources :customers, path: 'clientes'
  end
end
