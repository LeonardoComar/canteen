# frozen_string_literal: true

class ChangeColumnBirthDateFromHumanResources < ActiveRecord::Migration[7.0]
  def change
    change_column(:human_resources, :birth_date, 'date USING CAST(birth_date AS date)')
  end
end
