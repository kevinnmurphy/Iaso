class CreateFoodlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :foodlogs do |t|
      t.integer :quantity

      t.belongs_to :food, null: false, foreign_key: true
      t.belongs_to :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end