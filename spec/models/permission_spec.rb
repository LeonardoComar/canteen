require 'rails_helper'

RSpec.describe Permission, type: :model do
  context 'validation' do
    it 'name, category and internal_name cannot be blank' do
      permission = Permission.new(name: '', category: '', internal_name: '')

      result = permission.valid?

      expect(result).to be false
      expect(permission.errors[:name]).to include ('não pode ficar em branco')
      expect(permission.errors[:category]).to include ('não pode ficar em branco')
      expect(permission.errors[:internal_name]).to include ('não pode ficar em branco')
    end

    it 'name and internal_name must be uniqueness' do
      Permission.create!(id: 200, name: 'Create Customer', category: 'customer', internal_name: 'new_customer')
      permission = Permission.new(name: 'Create Customer', category: '', internal_name: 'new_customer')

      result = permission.valid?

      expect(result).to be false
      expect(permission.errors[:name]).to include ('já está em uso')
      expect(permission.errors[:internal_name]).to include ('já está em uso')
    end
  end

  context 'Successfully' do
    it 'all attributes validate' do
      permission = Permission.new(name: 'Create Customer', category: 'customer', internal_name: 'new_customer')

      result = permission.valid?

      expect(result).to be true
      expect(permission.errors[:name]).not_to include ('não pode ficar em branco')
      expect(permission.errors[:status]).not_to include ('não pode ficar em branco')
    end
  end
end
