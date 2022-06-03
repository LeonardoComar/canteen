# frozen_string_literal: true

class RenameMatriculationCodeColumnFromHumanResources < ActiveRecord::Migration[7.0]
  def change
    rename_column(:human_resources, :matriculation_code, :document)
  end
end
