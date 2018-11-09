class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :movie

  validates :customer_id, presence: true
  validates :movie_id, presence: true
  validates :checkout_date, presence: true

  def self.checkout!(customer_id, movie_id)
    rental = Rental.new(customer_id: customer_id, movie_id: movie_id)


    transaction do
      rental.checkout_date = Date.today
      rental.checkin_date = Date.today + 1.week
      rental.save!

      customer_rental = rental.customer.rentals.count + 1
      rental.customer.update(movies_checked_out_count: customer_rental)

      # customer.increment!(:movies_checked_out_count)
      rental.movie.decrement!(:inventory)
      rental.movie.status = 'unavailable'

    end
    return rental
  end

  # def self.checkin!(customer_id, movie_id)
  #   rental = rental.find_by.(customer_id: customer_id, movie_id: movie_id)
  #   binding.pry
  #
  #   transaction do
  #     movie.status = :available
  #     rental.movie.increment!(:inventory)
  #     rental.save!
  #   end
  end
