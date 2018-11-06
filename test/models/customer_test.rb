require "test_helper"

describe Customer do
  let(:customer) { customers (:one) }

  it "must be valid" do
    value(customer).must_be :valid?
  end

  it 'must have required fields' do
    fields = [:name, :registered_at,:address, :city, :state, :postal_code, :phone, ]
    fields.each do |field|
      expect(customer).must_respond_to field
    end
  end

  describe 'Relationships' do
    it 'can have many rentals' do
      rentals = Rental.all
      expect(rentals.length).must_be :>=, 1
      rentals.each do |rental|
        expect(rental).must_be_instance_of Rental
      end
    end
  end

  describe "customer#movies_checked_out_count method" do

    it "returns correct amount of checked out movies by customer" do

      rental = Rental.first
      second_rental = Rental.last
      customer.rentals << rental

      expect(customer.movies_checked_out_count).must_equal 1
      customer.rentals << second_rental

      expect(customer.movies_checked_out_count).must_equal 2
    end
  end
end
