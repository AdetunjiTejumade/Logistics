# frozen_string_literal: true

class CreateWarehouses < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouses do |t|
      t.string :location

      t.timestamps
    end
  end
end
