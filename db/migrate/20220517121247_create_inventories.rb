# frozen_string_literal: true

class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string :item
      t.integer :quantity
      t.references :warehouse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
