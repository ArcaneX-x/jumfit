class Lesson < ApplicationRecord
  belongs_to :course
  has_many_attached :images
  validates :title, presence: true
end
