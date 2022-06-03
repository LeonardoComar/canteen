# frozen_string_literal: true

require 'rails_helper'
include LoginMethods

feature 'User log in' do
  scenario 'Successfully' do
    human_resource = HumanResource.create!(name: 'Roger Braga', phone: '994384596', document: '00001', birth_date: '1998-11-09', role_id: 2)
    user = User.create!(email: 'manager@email.com', login: 'manager', password: '123456789', status: 'active', human_resource: human_resource)

    visit new_user_session_path

    fill_in I18n.t(:login, scope: %i[activerecord attributes user]), with: user.login
    fill_in I18n.t(:password, scope: %i[activerecord attributes user]), with: user.password
    click_on 'Log in'

    expect(current_path).to eq root_path
    expect(page).to have_content(I18n.t(:signed_in, scope: %i[devise sessions]))
    expect(page).to have_link(I18n.t(:sign_out, scope: %i[devise sessions destroy]))
    expect(page).not_to have_link(I18n.t(:sign_in, scope: %i[devise sessions new]))
  end

  scenario 'Logout' do
    login_as(login_user_manager, scope: :user)

    visit root_path
    click_on I18n.t(:sign_out, scope: %i[devise sessions destroy])

    expect(current_path).to eq new_user_session_path
    expect(page).to have_content(I18n.t(:signed_out, scope: %i[devise sessions]))
    expect(page).to have_content(I18n.t(:login, scope: %i[activerecord attributes user]))
    expect(page).not_to have_link(I18n.t(:sign_out, scope: %i[devise sessions destroy]))
  end

  scenario 'Voluntary view only options in menu for this role' do
    login_as(login_user_voluntary, scope: :user)

    visit root_path

    expect(find(class: ['bi-house'], :visible => :all).visible?).to eq true
  end
end
