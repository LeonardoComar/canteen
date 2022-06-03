# frozen_string_literal: true

class Role < ApplicationRecord

  has_many :human_resources
  has_and_belongs_to_many :permissions

  str_enum :status, %w[active inactive], default: :active

  validates :name, :status, presence: true
  validates :name, uniqueness: true
end
