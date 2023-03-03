class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 35 }
  enum :role, %i[user admin]
  has_many :payments
  has_many :course_users
  has_many :courses, through: :course_users
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_one :profile
end