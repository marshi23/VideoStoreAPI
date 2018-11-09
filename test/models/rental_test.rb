require "test_helper"

describe Rental do
  let (:rental) { rentals (:one) }

  it "can be created" do
      expect(rental.valid?).must_equal true
  end

  it "is invalid when customer_id, movie_id, and checkin_date are not provided" do
    required_fields = [:customer_id, :movie_id, :checkin_date]

    required_fields.each do |field|
      rental[field] = nil

      expect(rental.valid?).must_equal false

      rental.reload
    end
  end

end
