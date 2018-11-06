class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :movie

  validates :customer_id, presence: true
  validates :movie_id, presence: true
  validates :checkin_date, presence: true


  def checkout(movie_id, customer_id)

    self.checkout_date = Date.today
    self.checkin_date = Date.today + 1.weeks

    customer = Customer.where(id: customer_id.to_i)
    movie = Movie.where(id: movie_id.to_i)
    binding.pry
    customer.movies_checked_out_count + 1
    movie.inventory - 1

  end

end
