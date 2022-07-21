# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :matriculation_code
      t.string :password
      t.decimal :credit, precision: 5, scale: 2
      t.string :status

      t.timestamps
    end
  end
end
