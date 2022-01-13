class Answer < ApplicationRecord
    belongs_to :user
    belongs_to :talk
    has_many :likes, dependent: :destroy
    has_many:liked_users, through: :likes, source: :user
end
