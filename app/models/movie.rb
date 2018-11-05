class Movie < ApplicationRecord
  has_many :rentals, :foreign_key => :movie_id
end
