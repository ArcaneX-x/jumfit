class Course < ApplicationRecord
  has_many :course_users
  has_many :users, through: :course_users
  has_many :lessons
  has_many :payments

  validates :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  # Has this user paid for the course?
  def user_paid?(user)
    payments.where(user: user).sum(:amount) >= price
  end
  # List of the users that paid for the course
  def users_paid
    users.select { |user| user_paid?(user) }
  end
end
