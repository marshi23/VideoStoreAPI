require "test_helper"

describe RentalsController do
  describe "checkout" do

    it "has a working route" do
      rental_id = 1
      rental_params = {
        customer_id: 298486374, # id for first customer in customer yml
        movie_id: 298486374 # id for first movie in movie yml
      }

      post checkout_path(rental_id), { :params => rental_params }
      must_respond_with :success
    end


    it "returns a bad_request status if params is not given" do
      rental_id = 1
      post checkout_path(rental_id)

      must_respond_with :not_found

    end
  end
end
