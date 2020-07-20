class Meal < ApplicationRecord
    # t.integer :calorie_count
    # t.string :category
    # t.belongs_to :user, foreign_key: true
    # t.belongs_to :food, foreign_key: true

    belongs_to :user
    belongs_to :food

    validates :name, presence: true


end