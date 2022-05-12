# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable, :trackable

  belongs_to :human_resource

  def has_permission?(internal_name_permission)
    return false if human_resource.role.blank?

    permission = Permission.find_by(internal_name: internal_name_permission.to_s)

    human_resource.role.permissions.include? permission
  end
end
