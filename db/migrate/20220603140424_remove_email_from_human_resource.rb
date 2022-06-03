# frozen_string_literal: true

class RemoveEmailFromHumanResource < ActiveRecord::Migration[7.0]
  def change
    remove_column(:human_resources, :email)
  end
end
