class Meal < ApplicationRecord
    # t.string :name

    belongs_to :user
    has_many :foodlogs
    has_many :foods, through: :foodlogs

    validates :name, presence: true


end