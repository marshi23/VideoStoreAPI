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
  it "will fail with a missing field" do
    fields = [:name, :registered_at,:address, :city, :state, :postal_code, :phone, ]
    fields.each do |field|
      customer[field] = nil
      expect(customer.valid?).must_equal false
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
end
