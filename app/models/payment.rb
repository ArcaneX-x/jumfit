class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :amount, presence: true, numericality: { greater_than: 0 }
end
