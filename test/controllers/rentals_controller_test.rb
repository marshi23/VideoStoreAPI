require "test_helper"

describe RentalsController do

  describe "checkout" do

    it "has a working route" do
      rental_id = 1

      rental_params = {
        customer_id: customers(:one)[:id], # id for first customer in customer yml
        movie_id: movies(:one)[:id] # id for first movie in movie yml
      }

      post rentals_checkout_path(rental_id), { :params => rental_params }
      must_respond_with :success
    end


    it "returns a bad_request status if params is not given" do
      rental_id = -1
      post rentals_checkout_path(rental_id)

      must_respond_with :not_found

    end
  end

  describe "checkin" do
    it 'has a working route'do
      rental_id = rentals(:one)[:id]

      rental_params = {
        customer_id: customers(:one)[:id], # id for first customer in customer yml
        movie_id: movies(:one)[:id] # id for first movie in movie yml
      }
      # binding.pry
      post rentals_checkin_path(rental_id), { :params => rental_params }
      must_respond_with :success

    end


    # it "test" do
  #   rental = rentals(:one)
  #   rental_params = {
  #     customer_id: customers(:one)[:id],
  #     movie_id: movies(:one)[:id]
  #   }
  #   # # rental_id = 1
  #   # rental.movie.status.must_equal 'available'
  #
  #   # rental.movie.status
  #   # binding.pry
  #   # post checkout_path
  #   #
  #   # post rentals_checkout_path(rental.id), {:params => rental_params}
  #
  #   rental.checkout!(rental_params[:customer_id], rental_params[:movie_id])
  #
  # binding.pry
  #
  #
  #   rental.movie.status.must_equal 'unavailable'
    # end
  end

end
