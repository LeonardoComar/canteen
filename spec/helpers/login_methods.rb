# frozen_string_literal: true

module LoginMethods
  def login_user_manager
    human_resource = HumanResource.create!(name: 'Roger Braga', phone: '994384596', matriculation_code: '00001', email: 'admin@email.com', status: 'active', birth_date: '1998-11-09', role_id: 2)
		user = User.create!(email: 'manager@email.com', login: 'manager', password: '123456789', status: 'active', human_resource: human_resource)
		user
	end

  def login_user_voluntary
    human_resource = HumanResource.create!(name: 'Agnes Maria', phone: '992430499', matriculation_code: '00001', email: 'voluntary@email.com', status: 'active', birth_date: '1998-11-09', role_id: 1)
    user = User.create!(email: 'manager@email.com', login: 'manager', password: '123456789', status: 'active', human_resource: human_resource)
		user
  end
end