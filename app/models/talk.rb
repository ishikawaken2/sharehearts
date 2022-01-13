class Talk < ApplicationRecord
    #アソシエーション(1:多)
    belongs_to :user
    has_many :empathies, dependent: :destroy
    has_many :empathied_users, through: :empathies, source: :user
    has_many :answers, dependent: :destroy
    has_many :likes, dependent: :destroy
end
