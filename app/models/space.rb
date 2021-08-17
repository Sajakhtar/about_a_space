class Space < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos


  SPACES = ['Office', 'Conference Room', 'Hall'].freeze
  validates :space, presence: true, inclusion: { in: SPACES }
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :address, presence: true
  validates :price, presence: true, numericality: true
  validates :capacity, presence: true, numericality: true
end
