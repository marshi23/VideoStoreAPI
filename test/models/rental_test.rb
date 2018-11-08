require "test_helper"

describe Rental do
  let (:rental) { rentals (:one) }
  let (:movie) { movies (:one)}

  it "will fail without customer_id, movie_id, and checkin_date" do
    required_fields = [:customer_id, :movie_id, :checkin_date]

    required_fields.each do |field|

     rental[field] = nil

      expect(rental.valid?).must_equal false

      rental.reload
    end
  end
end
