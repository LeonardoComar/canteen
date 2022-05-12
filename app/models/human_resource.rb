# frozen_string_literal: true

class HumanResource < ApplicationRecord
  has_one :user
  belongs_to :role
end
