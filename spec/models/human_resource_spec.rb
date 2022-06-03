require 'rails_helper'

RSpec.describe HumanResource, type: :model do
	context 'validation errors' do
    it 'name, document and role_id cannot be blank' do
			human_resource = HumanResource.new

			result = human_resource.valid?

			expect(result).to be false
      expect(human_resource.errors[:name]).to include ('não pode ficar em branco')
      expect(human_resource.errors[:document]).to include ('não pode ficar em branco')
			expect(human_resource.errors[:role]).to include ('não pode ficar em branco')
		end

		it 'document must be uniqueness' do
			HumanResource.create!(name: 'Agnes Maria', phone: '992430499', document: '00001', birth_date: '1998-11-09', role_id: 1)
			human_resource = HumanResource.new(document: '00001')

      result = human_resource.valid?

      expect(result).to be false
      expect(human_resource.errors[:document]).to include ('já está em uso')
		end
	end
end
