class RentalsController < ApplicationController
  def checkout
    rental = Rental.new(rental_params)
    rental.checkout!

    status: :ok
  rescue
    status :bad_request
  end

  # def checkin
  # end

  private
  def rental_params
    params.require(:rental).permit(:customer_id, :movie_id)
  end
end
