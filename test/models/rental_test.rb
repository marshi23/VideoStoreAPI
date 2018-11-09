require "test_helper"

describe Rental do
  let (:rental) { rentals (:one) }
  let (:movie) { movies (:one)}

  it "can be created" do
      expect(rental.valid?).must_equal true
  end

  it "will fail without customer_id, movie_id, and checkin_date" do
    required_fields = [:customer_id, :movie_id, :checkin_date]

    required_fields.each do |field|

      rental[field] = nil

      expect(rental.valid?).must_equal false
    end
       rental.reload
  end


end
