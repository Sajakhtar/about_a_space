class Review < ApplicationRecord
  belongs_to :user
  belongs_to :space

  validates :comment, presence: true
  RATINGS = [1, 2, 3, 4, 5].freeze
  validates :rating, presence: true, inclusion: { in: RATINGS }, numericality: true
end
