# frozen_string_literal: true

class Customer < ApplicationRecord
  before_create :set_default_credit

  str_enum :status, %w[active inactive], default: :active

  validates :name, :matriculation_code, :password, presence: true
  validates :name, :matriculation_code, uniqueness: true
  validates :password, length: { in: 6..12 }
  validates :password, numericality: { only_integer: true }
  validates :password, confirmation: true, on: %i[create update]
  validates :password_confirmation, presence: true, on: %i[create]
  validates :credit, numericality: true
  
  def add_credit(value_credit)
    if is_number?(value_credit) && value_credit.to_f > 0
      self.credit += value_credit.to_f
      save!
    else
      false
    end
  end

  private

  def set_default_credit
    self.credit = 0.0
  end

  def is_number?(value_credit)
    true if Float(value_credit) rescue false
  end
end
