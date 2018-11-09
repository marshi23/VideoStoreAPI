class RentalsController < ApplicationController

  def create
    rental = Rental.new
  end

  def checkout
    
    if rental_params[:customer_id] && rental_params[:movie_id]
      rental = Rental.checkout!(rental_params[:customer_id], rental_params[:movie_id])
      render json: { ok: true, message: 'Checkout successful!' }, status: :ok
    else
      render json: { ok: false, message: 'Unable to checkout' },
      status: :not_found
    end

  end

  def checkin

    if rental_params[:customer_id] && rental_params[:movie_id]
     rental = Rental.checkin!(rental_params[:customer_id], rental_params[:movie_id])
     render json: { ok: true, message: 'Checkin successful!' }, status: :ok
   else
     render json: { ok: false, message: 'Unable to checkin' },
     status: :not_found
   end

  end

  private
  def rental_params
    params.permit(:customer_id, :movie_id)
  end

end
