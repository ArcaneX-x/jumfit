class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, %i[user admin]
  has_many :payments
  has_many :course_users
  has_many :courses, through: :course_users
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_one :profile, dependent: :destroy
  validates :name, presence: true, length: { maximum: 35 }

  after_commit :set_profile, on: :create
  accepts_nested_attributes_for :profile

  private

  def set_profile
    create_profile # self.profile = Profile.create
    profile.set_default_avatar
  end
end
