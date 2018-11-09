require "test_helper"

describe Rental do
  let (:rental) { rentals (:one) }
  let (:movie) { movies (:one)}

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

  it 'will change a movies status to unavailable'do
    movie.rentals.count = 3

    post rentals_checkout_path

    movie[:status].must_equal 'unavailable'
  end

  it 'will return a movie and adjust inventory' do
  binding.pry

    rental.checkin(1, 2)
    expect{ patch movies_update_path}.must_change 'rental.movie(:inventory)', 1
  end

end
