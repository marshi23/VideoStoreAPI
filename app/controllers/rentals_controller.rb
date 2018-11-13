class RentalsController < ApplicationController

  def checkout

    if rental_params[:customer_id] && rental_params[:movie_id]
      rental = Rental.checkout!(rental_params[:customer_id], rental_params[:movie_id])
      render json: { ok: true, message: 'Checkout successful!' }, status: :ok
    else
      render json: { ok: false, message: 'Unable to checkout' },
      status: :not_found
    end

  rescue ArgumentError
    render json: { ok: false, message: 'Unable to checkout: movie or customer does not exist' }, status: :not_found
  end

  def checkin
 rental = Rental.find_by(customer_id: rental_params[:customer_id], movie_id: rental_params[:movie_id])

    if rental_params[:customer_id]  && rental_params[:movie_id]
      rental.checkin(rental_params[:customer_id],rental_params[:movie_id])
     render json: { ok: true, message: 'Checkin successful!' }, status: :ok
   else
     render json: { ok: false, message: 'Unable to checkin' },
     status: :not_found
   end

 rescue ArgumentError
   render json: { ok: false, message: 'Unable to checkin: movie or customer does not exist' }, status: :not_found
  end

  private
  def rental_params
    params.permit(:customer_id, :movie_id)
  end

end
