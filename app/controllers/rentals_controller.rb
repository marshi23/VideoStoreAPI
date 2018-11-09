class RentalsController < ApplicationController

  def create
    rental = Rental.new
  end

  def checkout

    if rental_params[:customer_id] && rental_params[:movie_id]

      # rental = Rental.new(customer_id: rental_params[:customer_id],
      #   movie_id: rental_params[:movie_id])

      rental = Rental.checkout!(rental_params[:customer_id], rental_params[:movie_id])
 
      render json: { ok: true, message: 'Checkout successful!' }, status: :ok

    else
      render json: { ok: false, message: 'Unable to checkout' },
      status: :not_found
    end

  # rescue
  #   status :bad_request
  end

  def checkin

  end

  private
  def rental_params
    params.permit(:customer_id, :movie_id)
  end

end
