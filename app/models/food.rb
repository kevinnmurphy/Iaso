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
    validates :calories, presence: true
    # validates :carbs, presence: true
    # validates :proteins, presence: true
    # validates :fats, presence: true


end