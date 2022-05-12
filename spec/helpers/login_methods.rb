# frozen_string_literal: true

module LoginMethods
  def login_user_manager
		user = User.create!(email: 'manager@email.com', login: 'manager', password: '123456789', status: 'active')
		user
	end
end