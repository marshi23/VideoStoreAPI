class RentalsController < ApplicationController

  def checkout
    rental = Rental.new(rental_params)
    checked_out_rental = rental.checkout(params[:movie_id], params[:customer_id])
    # render json:  rental.as_json(only: [:customer_id, :movie_id]), status: :ok

  end

  # def checkin
  # end

  private
  def rental_params
    params.require(:rental).permit(:customer_id, :movie_id)
  end
end
