class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :movie

  validates :customer_id, presence: true
  validates :movie_id, presence: true
  validates :checkin_date, presence: true

  def checkout!
    transaction do
      self.checkout_date = Date.today
      self.checkin_date = Date.today + 1.week
      save!

      customer.increment!(:movies_checked_out_count)
      movie.decrement!(:inventory)
    end
  end

  # def checkin!
  #
  # end
end
