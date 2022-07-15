# frozen_string_literal: true

namespace :provisioning do
	namespace :shared do
		namespace :dataset do
			namespace :dataset_base do
				desc 'Populate all data base, for development environment'
				task populate: :environment do
					def prefix
						"Task [provisioning:shared:dataset:dataset_base:populate] [#{DateTime.current}]:"
					end
					
					puts "#{prefix} Initialized"

					human_resource = HumanResource.create!(name: 'Admin', phone: '992430499', document: '09402325964', birth_date: '1998-11-09', role_id: 2)
					User.create!(email: 'manager@email.com', login: 'admin', password: 'admin123', status: 'active', human_resource: human_resource)
					
					puts "#{prefix} Finished"
				end
			end
		end
	end
end