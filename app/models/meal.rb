class Meal < ApplicationRecord
    # t.string :name

    belongs_to :user
    has_many :foodlogs
    has_many :foods, through: :foodlogs

    validates :name, presence: true

    scope :order_by_calories, -> { order(price: :desc)}
    scope :order_by_carbs, -> { order(carbs: :desc)}

    # extend Search::ClassMethods

    def foodlogs_attributes=(foodlogs_attributes)
        foodlogs_attributes.values.each do |foodlogs_attribute| 
          foodlogs = Foodlog.find_or_create_by(foodlog_attribute)
          self.foodlogs << foodlog
        end	  
    end

    def foods_attributes=(foods_attributes)
        foods_attributes.values.each do |foods_attribute| 
          foods = Food.find_or_create_by(food_attribute)
          self.foods << food
        end	  
    end


    def todays_meals
        Meal.all.today
    end

    def self.today 
        where("created_at >= ?", Time.now.beginning_of_day) 
    end

    # Today.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)

    # Author.joins(:articles).where(articles: { author: author })

    # def calculate_macros(macro)
    #     count = 0
    #     self.foodlogs.each do |foodlog|
    #         count += foodlog.quantity * foodlog.food.(macro)
    #     end
    #     count
    # end


    def calculate_calories
        count = 0
        quantity = self.foodlogs.first.quantity
        calories = self.foodlogs.first.food.calories
        count = quantity * calories
        count
    end

    # def calculate_calories
    #     count = 0
    #     self.foodlogs.each do |foodlog|
    #         count += foodlog.serving_calories
    #     end
    #     count
    # end

    def calculate_carbs
        count = 0
        self.foodlogs.each do |foodlog|
            count += foodlog.serving_carbs
        end
        count
    end

    def calculate_fats
        count = 0
        self.foodlogs.each do |foodlog|
            count += foodlog.serving_fats
        end
        count
    end

    def calculate_proteins
        count = 0
        self.foodlogs.each do |foodlog|
            count += foodlog.serving_proteins
        end
        count
    end

    #view example
    # @meal.order_by_calories.order_by_carbs(15)
end