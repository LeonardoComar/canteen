require 'rails_helper'

RSpec.describe Role, type: :model do
  context 'validation errors' do
    it 'name cannot be blank' do
      role = Role.new(name: '')

      result = role.valid?

      expect(result).to be false
      expect(role.errors[:name]).to include ('não pode ficar em branco')
      expect(role.active?).to be true
    end

    it 'name must be uniqueness' do
      role = Role.new(name: 'manager')

      result = role.valid?

      expect(result).to be false
      expect(role.errors[:name]).to include ('já está em uso')
    end
  end

  context 'Successfully' do
    it 'all attributes validate' do
      role = Role.new(name: 'function')

      result = role.valid?

      expect(result).to be true
      expect(role.errors[:name]).not_to include ('não pode ficar em branco')
      expect(role.errors[:status]).not_to include ('não pode ficar em branco')
    end
  end
end
