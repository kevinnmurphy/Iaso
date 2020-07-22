class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :category
      t.integer :carbs
      t.integer :proteins
      t.integer :fats
      t.integer :calories

      t.belongs_to :user

      t.timestamps
    end
  end
end