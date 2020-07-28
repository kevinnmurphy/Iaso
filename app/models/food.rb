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
    validates :calories, numericality: { greater_than_or_equal_to: 0}
    validates :carbs, :proteins, :fats, presence: true
    validates :carbs, :proteins, :fats, numericality: { greater_than_or_equal_to: 0}

    scope :order_by_name, -> { order(name: asc) }

    # scope :order_by_property, ->(num) { where('num < ? ', num) }
    scope :order_by_carbs, -> { order(carbs: asc) }
    scope :order_by_fats, -> { order(fats: asc) }
    scope :order_by_proteins, -> { order(proteins: asc) }

    # extend Search::ClassMethods

    def foodlogs_attributes=(foodlogs_attributes)
        foodlogs_attributes.values.each do |foodlogs_attribute| 
          foodlogs = Foodlog.find_or_create_by(foodlog_attribute)
          self.foodlogs << foodlog
        end	  
    end

    def meals_attributes=(meals_attributes)
        meals_attributes.values.each do |meals_attribute| 
          meals = Meal.find_or_create_by(meal_attribute)
          self.meals << meal
        end	  
    end

end