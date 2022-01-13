class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  # アソシエーション(1:多)
  has_many :talks, dependent: :destroy
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
  has_many :empathies, dependent: :destroy
  has_many :empathied_talks, through: :empathies, source: :talk
  def already_empathied?(talk)
    self.empathies.exists?(talk_id: talk.id)
  end
  has_many :answers, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_answers, through: :likes, source: :answer
  def already_liked?(answer)  
    self.likes.exists?(answer_id: answer.id)
  end
end
