# frozen_string_literal: true

class CreateHumanResources < ActiveRecord::Migration[7.0]
  def change
    create_table :human_resources do |t|
      t.string :name
      t.string :phone
      t.string :matriculation_code
      t.string :email
      t.string :status
      t.string :birth_date
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
