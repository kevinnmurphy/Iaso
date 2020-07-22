class Food < ApplicationRecord
    # t.string :name
    # t.string :category
    # t.integer :carbs
    # t.integer :proteins
    # t.integer :fats
    # t.integer :calories

    belongs_to :user
    has_many :foodlogs
    has_many :meals, through: :foodlogs

    validates :name, presence: true
    # validates :calories, presence: true
    # validates :calories, numericality: { greater_than_or_equal_to: 0}
    # validates :carbs, presence: true
    # validates :carbs, numericality: { greater_than_or_equal_to: 0}
    # validates :proteins, presence: true
    # validates :proteins, numericality: { greater_than_or_equal_to: 0}
    # validates :fats, presence: true
    # validates :fats, numericality: { greater_than_or_equal_to: 0}


end