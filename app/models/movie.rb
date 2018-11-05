class Movie < ApplicationRecord
  has_many :rentals, :foreign_key => :movie_id

  validates :title, presence: true
  validates :overview, presence: true
  validates :release_date, presence: true
  validates :inventory, numericality: true
end
