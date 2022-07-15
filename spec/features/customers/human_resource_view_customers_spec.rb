# frozen_string_literal: true

require 'rails_helper'
include LoginMethods

feature 'Manager view customers' do
  xscenario 'Successfully' do
    Customer.create!(name: 'Antonin Dvořák', matriculation_code: '789123456', password: '123456', password_confirmation: '123456')
    
    login_as(login_user_manager, scope: :user)

    visit root_path

    ## error em clicar no ícone
    find(".bi-people", :visible => :true).click


    expect(current_path).to eq customers_path
    expect(page).to have_content('Antonin Dvořák')
    expect(page).to have_content('Ativo')
  end
end