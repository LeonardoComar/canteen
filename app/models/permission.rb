# frozen_string_literal: true

class Permission < ApplicationRecord
  has_and_belongs_to_many :roles

  validates :name, :category, :internal_name, presence: true
  validates :name, :internal_name, uniqueness: true
end
