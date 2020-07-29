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
    validates :name, uniqueness: true
    validates :calories, presence: true
    validates :calories, numericality: { greater_than_or_equal_to: 0}
    validates :carbs, :proteins, :fats, presence: true
    validates :carbs, :proteins, :fats, numericality: { greater_than_or_equal_to: 0}

    accepts_nested_attributes_for :foodlogs

    # scope :order_by_name, ->  order(name:) 

    # scope :order_by_property, ->(num) { where('num < ? ', num) }
    scope :order_by_carbs, -> { order(carbs: asc) }
    scope :order_by_fats, -> { order(fats: asc) }
    scope :order_by_proteins, -> { order(proteins: asc) }

    # extend Search::ClassMethods

    def self.order_by_name
        self.order(:name)
    end

    def foodlogs_attributes=(foodlogs_attributes)
        foodlogs_attributes.values.each do |foodlog_attributes| 
            # next unless foodlog_attributes[:quantity].present?
            next unless foodlog_attributes.values.all? { |v| v.present? }
            foodlog = Foodlog.find_or_create_by(foodlog_attributes)
            self.foodlogs << foodlog
        end	  
    end

    def meals_attributes=(meals_attributes)
        meals_attributes.values.each do |meal_attributes| 
            # {"quantity"=>"1", "meal_id"=>"8"}
            next unless meal_attributes.values.all? { |v| v.present? }
            meal = Meal.find_or_create_by(meal_attributes)
            self.meals << meal
        end	  
    end

end