class User < ApplicationRecord
    # t.string "name"
    # t.string "password_digest"
    # t.string "email"
    # t.integer "height"
    # t.integer "weight"
    # t.integer "bodyfat"
    # t.integer "calorie_limit"
    # t.string "photo"

    has_secure_password

    has_many :meals
    has_many :foodlogs, through: :meals
    has_many :foods

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :password, presence: true
    # validates :password, length: 8
    # validates :email, presence: true
    
    # validates :height, presence: true
    # validates :weight, presence: true



end