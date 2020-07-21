class User < ApplicationRecord
    # t.string "name"
    # t.string "password_digest"
    # t.integer "height"
    # t.integer "weight"
    # t.string "email"

    has_secure_password

    has_many :meals
    has_many :foods, through: :meals

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :password, presence: true
    # validates :password, length: 8


end