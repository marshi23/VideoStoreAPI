require "test_helper"

describe RentalsController do

  describe "checkout" do

    it "has a working route" do

      rental_params = {
        customer_id: customers(:one)[:id], # id for first customer in customer yml
        movie_id: movies(:one)[:id] # id for first movie in movie yml
      }

      post rentals_checkout_path, { :params => rental_params }
      must_respond_with :success
    end


    it "returns a bad_request status if invalid ids given" do

      rental_params = {
        customer_id: -1,
        movie_id: -1
      }

      post rentals_checkout_path, { :params => rental_params }

      must_respond_with :not_found

    end
  end

  describe "checkin" do
    it 'has a working route'do
      rental_id = rentals(:one)[:id]

      rental_params = {
        customer_id: customers(:one)[:id],
        movie_id: movies(:one)[:id]
      }

      post rentals_checkin_path, { :params => rental_params }
      must_respond_with :success

    end

    it "test" do
    rental = rentals(:one)
    rental_params = {
      customer_id: customers(:one)[:id],
      movie_id: movies(:one)[:id]
    }
    # rental_id = 1
    rental.movie.status.must_equal 'available'

    rental.movie.status


    post rentals_checkout_path(rental.id), {:params => rental_params}
    rental.reload
    # rental.checkout!(rental_params[:customer_id], rental_params[:movie_id])

    rental.movie.status.must_equal 'unavailable'
    end
  end
    it "tests check-in " do
      rental = rentals(:unavailable)
      rental_params = {
        customer_id: customers(:two)[:id],
        movie_id: movies(:three)[:id]
      }

      # rental.movie.status.must_equal 'unavailable'

      post rentals_checkin_path(rental.id), {:params => rental_params}

       rental.reload

      rental.movie.status.must_equal 'available'
    end

    it "adjusts inventory when a movie is checked out" do
      rental = rentals(:one)
      rental_params = {
        customer_id: customers(:one)[:id],
        movie_id: movies(:one)[:id]
      }

      post rentals_checkout_path(rental.id), {:params => rental_params}
      rental.reload

    expect(rental.movie.inventory).must_equal 9
    end
end
