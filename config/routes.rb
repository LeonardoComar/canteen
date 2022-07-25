# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"
  
  resources :customers, path: 'clientes' do
    get '/adicionar-credito', to: 'customers#new_credit', as: 'new_credit'
    post '/adicionar-credito', to: 'customers#update_credit', as: 'update_credit'
  end

  resources :human_resources, path: 'voluntarios'
  
  devise_for :users
  
  namespace :main, path: '', path_names: { new: 'novo', create: 'novo', edit: 'editar', update: 'editar' } do
  end
end
