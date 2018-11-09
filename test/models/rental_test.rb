require "test_helper"

describe Rental do
  let (:rental) { rentals (:one) }
  let (:movie) { movies (:one)}

  it "can be created" do
      expect(rental.valid?).must_equal true
  end

  it "will fail without customer_id, movie_id, and checkin_date" do
    required_fields = [:customer_id, :movie_id, :checkin_date]
# binding.pry
    required_fields.each do |field|

      rental[field] = nil

      expect(rental.valid?).must_equal false

      rental.reload
    end
  end
  #
  # it 'checkout changes a movies status to unavailable'do
  #
  #
  #   post rentals_checkout_path
  #
  #   movie[:status].must_equal 'unavailable'
  # end
  #
  # it 'returning a movie change the status to available' do
  #   rental.movie.status = "unavailable"
  #
  #   rental.checkin(1, 2)
  #
  #   expect{ patch movies_update_path}.must_change 'rental.movie(:status)', "available"
  # end
end
