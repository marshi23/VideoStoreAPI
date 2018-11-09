class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :movie

  validates :customer_id, presence: true
  validates :movie_id, presence: true
  validates :checkout_date, presence: true

  def self.checkout!(customer_id, movie_id)
    rental = Rental.new(customer_id: customer_id, movie_id: movie_id)

    if Movie.find_by(id: movie_id) && Customer.find_by(id: customer_id)
      transaction do
        rental.checkout_date = Date.today
        rental.checkin_date = Date.today + 1.week

          rental.save!
            customer_rental = rental.customer.rentals.count + 1
            rental.customer.update(movies_checked_out_count: customer_rental)

            rental.movie.decrement!(:inventory)
            rental.movie.status = 'unavailable'
      end
      return rental

    else
      raise ArgumentError, "Invalid customer or movie id"
    end
  end


  def self.checkin!(customer_id, movie_id)
    rental = Rental.find_by(customer_id: customer_id, movie_id: movie_id)
    movie = Movie.find_by(id: movie_id)

    if Movie.find_by(id: movie_id) && Customer.find_by(id: customer_id)
      transaction do
        movie.status = 'available'
        rental.movie.increment!(:inventory)
        rental.save!
      end
      return rental
    else
      raise ArgumentError, "Invalid customer or movie id"
    end

  end
end
