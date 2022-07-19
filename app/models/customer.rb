# frozen_string_literal: true

class Customer < ApplicationRecord
  str_enum :status, %w[active inactive], default: :active

  validates :name, :matriculation_code, :password, presence: true
  validates :name, :matriculation_code, uniqueness: true
  validates :password, length: { in: 6..12 }
  validates :password, numericality: { only_integer: true }
  validates :password, confirmation: true, on: %i[create update]
  validates :password_confirmation, presence: true, on: %i[create]
end
