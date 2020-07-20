class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.integer :calorie_count
      t.string :category

      t.belongs_to :user, foreign_key: true
      t.belongs_to :food, foreign_key: true

      t.timestamps
    end
  end
end
