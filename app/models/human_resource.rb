# frozen_string_literal: true

class HumanResource < ApplicationRecord
  has_one :user
  belongs_to :role

  str_enum :status, %w[active inactive], default: :active

  validates :name, :document, :role, presence: true
  validates :document, uniqueness: true

  def set_default_role!
    self.role_id = 1
  end
end
